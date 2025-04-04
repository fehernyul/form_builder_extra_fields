import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

//XX
/// Field for selecting value(s) from a searchable list
class FormBuilderSearchableDropdown<T> extends FormBuilderFieldDecoration<T> {
  ///offline items list
  // final List<T> items;

  final DropdownSearchOnFind<T>? items;

  ///selected item
  final T? selectedItem;

  ///selected items
  final List<T> selectedItems;

  ///called when a new items are selected
  final ValueChanged<List<T>>? onChangedMultiSelection;

  ///to customize list of items UI
  final DropdownSearchBuilder<T>? dropdownBuilder;

  ///to customize list of items UI in MultiSelection mode
  final DropdownSearchBuilderMultiSelection<T>? dropdownBuilderMultiSelection;

  ///customize the fields the be shown
  final DropdownSearchItemAsString<T>? itemAsString;

  ///	custom filter function
  final DropdownSearchFilterFn<T>? filterFn;

  ///function that compares two object with the same type to detected if it's the selected item or not
  final DropdownSearchCompareFn<T>? compareFn;

  ///dropdownSearch input decoration
  final InputDecoration? dropdownSearchDecoration;

  /// style on which to base the label
  // final TextStyle? dropdownSearchBaseStyle;

  /// How the text in the decoration should be aligned horizontally.
  final TextAlign? dropdownSearchTextAlign;

  /// How the text should be aligned vertically.
  final TextAlignVertical? dropdownSearchTextAlignVertical;

  final AutovalidateMode? autoValidateMode;

  /// An optional method to call with the final value when the form is saved via
  final FormFieldSetter<List<T>>? onSavedMultiSelection;

  /// callback executed before applying value change
  final BeforeChange<T>? onBeforeChange;

  /// callback executed before applying values changes
  final BeforeChangeMultiSelection<T>? onBeforeChangeMultiSelection;

  ///define whatever we are in multi selection mode or single selection mode
  final bool isMultiSelectionMode;

  ///called when a new item added on Multi selection mode
  final OnItemAdded<T>? popupOnItemAdded;

  ///called when a new item added on Multi selection mode
  final OnItemRemoved<T>? popupOnItemRemoved;

  ///widget used to show checked items in multiSelection mode
  final DropdownSearchPopupItemBuilder<T>? popupSelectionWidget;

  ///widget used to validate items in multiSelection mode
  final ValidationMultiSelectionBuilder<T?>? popupValidationMultiSelectionWidget;

  ///widget to add custom widget like addAll/removeAll on popup multi selection mode
  final ValidationMultiSelectionBuilder<T>? popupCustomMultiSelectionWidget;

  // ///function that returns item from API
  // final DropdownSearchOnFind<T>? asyncItems;

  final PopupProps<T> popupProps;

  ///custom dropdown clear button icon properties
  final ClearButtonProps? clearButtonProps;

  /// style on which to base the label
  final TextStyle? dropdownSearchTextStyle;

  ///custom dropdown icon button properties
  final DropdownButtonProps? dropdownButtonProps;

  /// opens the search list when press a letter on the physical keyboard
  final bool openSearchListOnLetterKeyDown;

  /// fill backgound with this color when focused
  final Color? focusedColor;

  ///DropdownSearch widget key
  final Key? dropdownSearchKey;

  final bool? isHovering;

  /// Creates field for selecting value(s) from a searchable list
  FormBuilderSearchableDropdown(
      {super.key,
      super.autovalidateMode,
      super.enabled,
      super.focusNode,
      super.onSaved,
      super.validator,
      super.decoration,
      required super.name,
      super.initialValue,
      super.onChanged,
      super.valueTransformer,
      super.onReset,
      // this.asyncItems,
      this.autoValidateMode,
      this.compareFn,
      this.dropdownBuilder,
      this.dropdownSearchDecoration,
      this.dropdownSearchTextAlign,
      this.dropdownSearchTextAlignVertical,
      this.filterFn,
      // this.isFilteredOnline = false,
      this.itemAsString,
      this.items,
      this.onBeforeChange,
      this.popupOnItemAdded,
      this.popupOnItemRemoved,
      this.popupSelectionWidget,
      this.selectedItem,
      this.selectedItems = const [],
      this.popupProps = const PopupProps.menu(
        showSearchBox: true,
        fit: FlexFit.loose,
      ),
      this.clearButtonProps,
      this.dropdownSearchTextStyle,
      this.dropdownButtonProps,
      this.openSearchListOnLetterKeyDown = false,
      this.focusedColor,
      this.dropdownSearchKey,
      this.isHovering})
      : assert(T == String || compareFn != null),
        isMultiSelectionMode = false,
        dropdownBuilderMultiSelection = null,
        onBeforeChangeMultiSelection = null,
        onSavedMultiSelection = null,
        onChangedMultiSelection = null,
        popupValidationMultiSelectionWidget = null,
        popupCustomMultiSelectionWidget = null,
        super(
          builder: (FormFieldState<T?> field) {
            final state = field as FormBuilderSearchableDropdownState<T>;
            return DropdownSearch<T>(
              key: dropdownSearchKey,
              // Hack to rebuild when didChange is called

              // asyncItems: asyncItems,
              // clearButtonProps: clearButtonProps ?? const ClearButtonProps(),
              compareFn: compareFn,
              enabled: state.enabled,
              dropdownBuilder: dropdownBuilder,
              suffixProps: DropdownSuffixProps(
                dropdownButtonProps: dropdownButtonProps ?? const DropdownButtonProps(),
                clearButtonProps: clearButtonProps ?? const ClearButtonProps(),
              ),
              // dropdownButtonProps: dropdownButtonProps ?? const DropdownButtonProps(),

              decoratorProps: DropDownDecoratorProps(
                isHovering: isHovering ?? false,
                decoration: state.decoration,
                textAlign: dropdownSearchTextAlign,
                textAlignVertical: dropdownSearchTextAlignVertical,
                baseStyle: dropdownSearchTextStyle,
              ),
              filterFn: filterFn,
              items: items,
              itemAsString: itemAsString,
              onBeforeChange: onBeforeChange,
              onChanged: (value) {
                state.didChange(value);
              },
              popupProps: popupProps,
              selectedItem: state.value,
              openSearchListOnLetterKeyDown: openSearchListOnLetterKeyDown,
            );
          },
        );

  @override
  FormBuilderSearchableDropdownState<T> createState() => FormBuilderSearchableDropdownState<T>();
}

class FormBuilderSearchableDropdownState<T> extends FormBuilderFieldDecorationState<FormBuilderSearchableDropdown<T>, T> {}
