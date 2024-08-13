import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_app/app_state.dart';
import '../../model/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState=Provider.of<AppState>(context);
    final isSelected=appState.selectedCategoryId==category.categoryId;
    return GestureDetector(
      onTap:(){
        if(!isSelected){
            appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.white:Color(0x99FFFFFF),width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Colors.white: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Center children vertically
          children: [
            Icon(
              category.icon,
              color: isSelected ? Theme.of(context).primaryColor: Colors.white,
              size: 40,
            ),
            SizedBox(height: 10),  // Adds space between icon and text
            Text(
              category.name,
              style: TextStyle(color:isSelected ? Color(0xFFFF4700):  Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
