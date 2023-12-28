import 'dart:developer';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:short_video_app/model/customers.model.dart';

class AuthServices {
  // / instance of customer table collection /
  static CollectionReference customerTable =
      FirebaseFirestore.instance.collection('customer');

// register service  to register a new customer
  static Future<CustomerModel?> register({required CustomerModel regcustomer}) async {
    /* generating customer id */
    final customerId = "Customer-${math.Random().nextInt(1000)}";

    /* assinging customer id to the model */
    regcustomer.id = customerId;

    try {
      // creating customer for customer table in DB
      DocumentReference documentReference =
          await customerTable.add(regcustomer.toJson());

      // fetching just now  register customer
      final snapshot = await documentReference.get();

      // preparing raw data for customer model
      final rawData = snapshot.data() as Map<String, dynamic>;

      // converting raw data and sending to customer model
      final customer = CustomerModel.fromJson(rawData);

      // customer document id
      customer.docId = documentReference.id;

      // returning the customer
      return customer;
      // log(customerId.toString());
    } catch (e) {
      // / when some error occurs /
      return null;
    }
  }

// login service  to signIn old customer
  Future<CustomerModel?> loginService({required CustomerModel loginCustomer}) async {
    // / separating email & password from the customer model /
    final email = loginCustomer.email;
    final password = loginCustomer.password;

    // / now we will try to find the customer matched with this email & password from the customer table /
    try {
      final snapShot = await customerTable
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: password)
          .get();

      // now store all the matched customer with tis mail and password
      final customers = snapShot.docs;

      if (customers.isNotEmpty) {
        // / when there is atleast one customer present with this email and password /
        // / preparing raw data /
        final rawData = customers.first.data() as Map<String, dynamic>;

        // now sending the customer data to customer model
        final customer = CustomerModel.fromJson(rawData);

        return customer;
      } else {
        return null;
      }
    } catch (e) {
      // / when some error occurs /
      return null;
    }
  }
}
