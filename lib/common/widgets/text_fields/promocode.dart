
import 'package:ecommerce_app/common/widgets/shapes/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Promocode extends StatelessWidget {
  const Promocode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(USizes.sm),
      showBorder: true,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
        
              decoration: InputDecoration(
                border: InputBorder.none,
    
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Have a promocode ?',
              ),
            ),
          ),
    
          SizedBox(
            width: 80,
            
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(side: BorderSide.none),
              onPressed: (null),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
