import 'dart:html';

import 'package:flutter/material.dart';

import '../../philippines_rpcmb.dart';

typedef DropdownItemBuilder<T> = DropdownMenuItem<T> Function(
    BuildContext context, T value);
typedef SelectedItemBuilder<T> = Widget Function(BuildContext context, T value);

class _PhilippineDropdownView<T> extends StatelessWidget {
  const _PhilippineDropdownView({
    Key? key,
    required this.choices,
    this.onChanged,
    this.value,
    required this.itemBuilder,
    required this.hint,
    required this.selectedItemBuilder,
    this.validatorSet,
    this.decorationSet,
  }) : super(key: key);
  final List<T> choices;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final DropdownItemBuilder<T> itemBuilder;
  final SelectedItemBuilder<T> selectedItemBuilder;
  final Widget hint;
  final InputDecoration? decorationSet;
  final String? Function(T?)? validatorSet;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      validator: validatorSet,
      decoration: decorationSet,
      key: ValueKey(choices),
      value: value,
      isExpanded: true,
      items: choices.map((e) => itemBuilder.call(context, e)).toList(),
      hint: hint,
      selectedItemBuilder: (BuildContext context) {
        return choices
            .map((e) => selectedItemBuilder.call(context, e))
            .toList();
      },
      onChanged: onChanged,
    );
  }
}

class PhilippineRegionDropdownView extends StatelessWidget {
  const PhilippineRegionDropdownView(
      {Key? key,
      this.regions = philippineRegions,
      this.onChanged,
      this.value,
      this.itemBuilder,
      this.decorationModify,
      this.validatorModify})
      : super(key: key);
  final List<Region> regions;
  final ValueChanged<Region?>? onChanged;
  final Region? value;
  final DropdownItemBuilder<Region>? itemBuilder;
  final InputDecoration? decorationModify;
  final String? Function(Region?)? validatorModify;

  @override
  Widget build(BuildContext context) {
    return _PhilippineDropdownView(
      validatorSet: validatorModify,
      decorationSet: decorationModify,
      choices: regions,
      onChanged: onChanged,
      value: value,
      itemBuilder: (BuildContext context, e) {
        return itemBuilder?.call(context, e) ??
            DropdownMenuItem(value: e, child: Text(e.regionName));
      },
      hint: const Text('Select Region'),
      selectedItemBuilder: (BuildContext context, Region value) {
        return Text(value.regionName, overflow: TextOverflow.ellipsis);
      },
    );
  }
}

class PhilippineProvinceDropdownView extends StatelessWidget {
  const PhilippineProvinceDropdownView(
      {Key? key,
      required this.provinces,
      required this.onChanged,
      this.value,
      this.itemBuilder,
      this.decorationModify,
      this.validatorModify})
      : super(key: key);
  final List<Province> provinces;
  final Province? value;

  final ValueChanged<Province?> onChanged;
  final DropdownItemBuilder<Province>? itemBuilder;
  final InputDecoration? decorationModify;
  final String? Function(Province?)? validatorModify;

  @override
  Widget build(BuildContext context) {
    return _PhilippineDropdownView(
      validatorSet: validatorModify,
      decorationSet: decorationModify,
      choices: provinces,
      onChanged: onChanged,
      value: value,
      itemBuilder: (BuildContext context, e) {
        return itemBuilder?.call(context, e) ??
            DropdownMenuItem(value: e, child: Text(e.name));
      },
      hint: const Text('Select Province'),
      selectedItemBuilder: (BuildContext context, Province value) {
        return Text(value.name, overflow: TextOverflow.ellipsis);
      },
    );
  }
}

class PhilippineMunicipalityDropdownView extends StatelessWidget {
  const PhilippineMunicipalityDropdownView({
    Key? key,
    required this.municipalities,
    required this.onChanged,
    this.value,
    this.itemBuilder,
    this.decorationModify,
    this.validatorModify,
  }) : super(key: key);
  final List<Municipality> municipalities;
  final Municipality? value;

  final ValueChanged<Municipality?> onChanged;
  final DropdownItemBuilder<Municipality>? itemBuilder;
  final InputDecoration? decorationModify;
  final String? Function(Municipality?)? validatorModify;

  @override
  Widget build(BuildContext context) {
    return _PhilippineDropdownView(
      validatorSet: validatorModify,
      decorationSet: decorationModify,
      choices: municipalities,
      onChanged: onChanged,
      value: value,
      itemBuilder: (BuildContext context, e) {
        return itemBuilder?.call(context, e) ??
            DropdownMenuItem(value: e, child: Text(e.name));
      },
      hint: const Text('Select Municipality'),
      selectedItemBuilder: (BuildContext context, Municipality value) {
        return Text(value.name, overflow: TextOverflow.ellipsis);
      },
    );
  }
}

class PhilippineBarangayDropdownView extends StatelessWidget {
  const PhilippineBarangayDropdownView({
    Key? key,
    required this.barangays,
    required this.onChanged,
    this.value,
    this.itemBuilder,
    this.decorationModify,
    this.validatorModify,
  }) : super(key: key);
  final List<String> barangays;
  final String? value;

  final ValueChanged<String?> onChanged;
  final DropdownItemBuilder<String>? itemBuilder;
  final InputDecoration? decorationModify;
  final String? Function(String?)? validatorModify;

  @override
  Widget build(BuildContext context) {
    return _PhilippineDropdownView(
      validatorSet: validatorModify,
      decorationSet: decorationModify,
      choices: barangays,
      onChanged: onChanged,
      value: value,
      itemBuilder: (BuildContext context, e) {
        return itemBuilder?.call(context, e) ??
            DropdownMenuItem(value: e, child: Text(e));
      },
      hint: const Text('Select Barangay'),
      selectedItemBuilder: (BuildContext context, String value) {
        return Text(value, overflow: TextOverflow.ellipsis);
      },
    );
  }
}
