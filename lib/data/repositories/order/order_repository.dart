import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/repositories/authentication_respository.dart';
import 'package:ecommerce_app/features/shop/models/order_model.dart';
import 'package:ecommerce_app/utils/constants/key.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveOrder(OrderModel order) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(order.userId)
          .collection(UKeys.ordersCollection)
          .add(order.toJson());
    } catch (e) {
      throw 'Error occured while saving order';
    }
  }

  Future<List<OrderModel>> getAllOrder() async {
    try {
      final userId = AuthenticationRepository.instance.currentUser!.uid;
      if (userId.isEmpty) throw "unable to find user";

      final orderQuery = await _db
          .collection(UKeys.userCollection)
          .doc(userId)
          .collection(UKeys.ordersCollection)
          .get();

      if (orderQuery.docs.isNotEmpty) {
        final orderList = orderQuery.docs
            .map((order) => OrderModel.fromSnapshot(order))
            .toList();
        return orderList;
      }

      return [];
    } catch (e) {
      throw "Error occured while getting orders";
    }
  }
}
