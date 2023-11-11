import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(
      {super.key, required this.onSettingsChanged, required this.settings});

  final void Function(Settings) onSettingsChanged;
  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? _settings;

  @override
  void initState() {
    super.initState();
    _settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(_settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                'Sem Glutén',
                'Só exibe refeições sem glutén',
                _settings!.isGlutenFree,
                (value) => setState(() => _settings!.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose',
                _settings!.isLactoseFree,
                (value) => setState(() => _settings!.isLactoseFree = value),
              ),
              _createSwitch(
                'Vegana',
                'Só exibe refeições veganas',
                _settings!.isVegan,
                (value) => setState(() => _settings!.isVegan = value),
              ),
              _createSwitch(
                'Vegetariana',
                'Só exibe refeições vegetarianas',
                _settings!.isVegetarian,
                (value) => setState(() => _settings!.isVegetarian = value),
              ),
            ],
          )),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
