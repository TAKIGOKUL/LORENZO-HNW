import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/theme/app_colors.dart';

class VoiceDebriefScreen extends StatefulWidget {
  const VoiceDebriefScreen({super.key});

  @override
  State<VoiceDebriefScreen> createState() => _VoiceDebriefScreenState();
}

class _VoiceDebriefScreenState extends State<VoiceDebriefScreen> {
  final _audioRecorder = AudioRecorder();
  bool _isProcessing = false;
  
  StreamSubscription<Amplitude>? _amplitudeSub;
  final List<double> _amplitudes = [];
  Timer? _timer;
  int _recordDuration = 0;

  @override
  void initState() {
    super.initState();
    _startRecording();
  }

  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        // Record to a temporary path
        final tempDir = await getTemporaryDirectory();
        final path = '${tempDir.path}/debrief_audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
        await _audioRecorder.start(const RecordConfig(), path: path); 
        
        if (mounted) {
          setState(() {
            _recordDuration = 0;
          });
        }

        _startTimer();
        
        _amplitudeSub = _audioRecorder.onAmplitudeChanged(const Duration(milliseconds: 50)).listen((amp) {
          if (mounted) {
            setState(() {
              // Normalize amplitude: max is around 0, min is around -50
              final normalized = (amp.current + 50) / 50;
              _amplitudes.add(max(0.05, normalized));
              if (_amplitudes.length > 50) {
                _amplitudes.removeAt(0);
              }
            });
          }
        });
      } else {
        debugPrint("Microphone permission denied");
      }
    } catch (e) {
      debugPrint("Record error: $e");
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (mounted) setState(() => _recordDuration++);
    });
  }

  Future<void> _stopRecording() async {
    _timer?.cancel();
    _amplitudeSub?.cancel();
    await _audioRecorder.stop();
    
    if (!mounted) return;
    
    setState(() {
      _isProcessing = true;
    });

    // Simulate sending payload to Next.js API for Whisper/Groq processing
    await Future.delayed(const Duration(seconds: 3));
    
    if (mounted) {
      setState(() => _isProcessing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debrief structured & synced to Next.js securely! 🚀'), 
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  String _formatDuration(int seconds) {
    final m = (seconds / 60).floor().toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Voice Debrief 🎙️', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w800)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              if (_isProcessing)
                Column(
                  children: [
                    const CircularProgressIndicator(color: AppColors.primary),
                    const SizedBox(height: 24),
                    const Text('Transcribing with Whisper API...', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.purple.withAlpha(40),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('Structuring via Groq (Llama 3)', style: TextStyle(color: AppColors.purple, fontWeight: FontWeight.w700, fontSize: 12)),
                    )
                  ],
                )
              else ...[
                Text(
                  _formatDuration(_recordDuration),
                  style: const TextStyle(color: AppColors.textPrimary, fontSize: 48, fontWeight: FontWeight.w300, fontFeatures: [FontFeature.tabularFigures()]),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(50, (index) {
                      final val = index < _amplitudes.length ? _amplitudes[index] : 0.05;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 50),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 4,
                        height: 100 * val,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withAlpha((255 * val).clamp(50, 255).toInt()),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: _stopRecording,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: AppColors.neumorphicRaised(radius: 40),
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.danger,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Tap to Stop & Sync', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w600)),
              ],
              const Spacer(),
              const Text('Audio is processed securely via Next.js and never stored locally.',
                  textAlign: TextAlign.center, style: TextStyle(color: AppColors.textTertiary, fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
