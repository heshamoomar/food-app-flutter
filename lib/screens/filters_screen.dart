import 'package:flutter/material.dart';

import '../widgets/mian_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(void Function(Map<String, bool> filterData) setFilters,
      {super.key, required this.saveFilters, required this.currentFilter});

  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save_rounded),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Gluten-free'),
                  value: _glutenFree,
                  subtitle: const Text('Only include gluten-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  value: _vegetarian,
                  subtitle: const Text('Only include vegetarian meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  value: _vegan,
                  subtitle: const Text('Only include vegan meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose-free'),
                  value: _lactoseFree,
                  subtitle: const Text('Only include lactose-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
