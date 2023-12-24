import 'package:flutter/material.dart';

class CustomNotification extends Notification {
  const CustomNotification();
}

class DeletedItemNotification extends CustomNotification {
  const DeletedItemNotification();
}

class ModifiedItemNotification extends CustomNotification {
  const ModifiedItemNotification();
}