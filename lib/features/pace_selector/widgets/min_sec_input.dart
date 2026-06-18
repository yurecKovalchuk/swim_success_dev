import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MinSecInput extends StatefulWidget {
  final int minutes;
  final int seconds;
  final ValueChanged<int> onMinutesChanged;
  final ValueChanged<int> onSecondsChanged;

  const MinSecInput({
    super.key,
    required this.minutes,
    required this.seconds,
    required this.onMinutesChanged,
    required this.onSecondsChanged,
  });

  @override
  State<MinSecInput> createState() => _MinSecInputState();
}

class _MinSecInputState extends State<MinSecInput> {
  late TextEditingController _minController;
  late TextEditingController _secController;
  final FocusNode _minFocus = FocusNode();
  final FocusNode _secFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _minController = TextEditingController(text: _fmt(widget.minutes));
    _secController = TextEditingController(text: _fmt(widget.seconds));
  }

  @override
  void didUpdateWidget(MinSecInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.minutes != widget.minutes && !_minFocus.hasFocus) {
      _minController.text = _fmt(widget.minutes);
    }
    if (oldWidget.seconds != widget.seconds && !_secFocus.hasFocus) {
      _secController.text = _fmt(widget.seconds);
    }
  }

  @override
  void dispose() {
    _minController.dispose();
    _secController.dispose();
    _minFocus.dispose();
    _secFocus.dispose();
    super.dispose();
  }

  String _fmt(int v) => v.toString().padLeft(2, '0');

  Widget _buildField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required int maxValue,
    required ValueChanged<int> onChanged,
    FocusNode? nextFocus,
  }) {
    return SizedBox(
      width: 72,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2),
        ],
        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
        onTap: () => controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: controller.text.length,
        ),
        onChanged: (value) {
          final parsed = int.tryParse(value) ?? 0;
          onChanged(parsed.clamp(0, maxValue));
          if (value.length == 2 && nextFocus != null) {
            nextFocus.requestFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildField(
          controller: _minController,
          focusNode: _minFocus,
          maxValue: 99,
          onChanged: widget.onMinutesChanged,
          nextFocus: _secFocus,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            ':',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        _buildField(
          controller: _secController,
          focusNode: _secFocus,
          maxValue: 59,
          onChanged: widget.onSecondsChanged,
        ),
      ],
    );
  }
}
