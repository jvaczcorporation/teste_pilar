import 'package:flutter/material.dart';
import 'package:teste_pilar/app/commons/commons.dart';

class Option {
  final String label;
  final String value;

  const Option({required this.label, required this.value});
}

class SwitchOptions extends StatefulWidget {
  final List<Option> options;
  final Function(Option) onChanged;

  const SwitchOptions({
    super.key,
    required this.options,
    required this.onChanged,
  });

  @override
  State<SwitchOptions> createState() => _SwitchOptionsState();
}

class _SwitchOptionsState extends State<SwitchOptions> {
  late Option _selectedOption;

  @override
  void initState() {
    _selectedOption = widget.options.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppTheme.primary,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          ...widget.options.map((option) {
            final isSelected = option.value == _selectedOption.value;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primary : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                onTap: !isSelected
                    ? () {
                        widget.onChanged(option);
                        setState(() {
                          _selectedOption = option;
                        });
                      }
                    : null,
                child: Center(
                  child: Text(
                    option.label,
                    style: TextStyle(
                      color: isSelected ? Colors.tealAccent : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
