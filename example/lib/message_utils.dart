import 'package:sfmc/inbox_message.dart';
import 'package:sfmc/sfmc.dart';
import 'package:intl/intl.dart';

Future<List<InboxMessage>> fetchReadMessages() async {
  final List<String> messages = await SFMCSdk.getReadMessages();
  return InboxMessage.parseMessages(messages);
}

Future<List<InboxMessage>> fetchUnreadMessages() async {
  final List<String> messages = await SFMCSdk.getUnreadMessages();
  return InboxMessage.parseMessages(messages);
}

Future<List<InboxMessage>> fetchDeletedMessages() async {
  final List<String> messages = await SFMCSdk.getDeletedMessages();
  return InboxMessage.parseMessages(messages);
}

Future<int> fetchMessageCount() async {
  final int? count = await SFMCSdk.getMessageCount();
  return count ?? 0;
}

Future<int> fetchReadMessageCount() async {
  final int? count = await SFMCSdk.getReadMessageCount();
  return count ?? 0;
}

Future<int> fetchUnreadMessageCount() async {
  final int? count = await SFMCSdk.getUnreadMessageCount();
  return count ?? 0;
}

Future<int> fetchDeletedMessageCount() async {
  final int? count = await SFMCSdk.getDeletedMessageCount();
  return count ?? 0;
}

Future<void> setMessagesRead(String id) async {
  await SFMCSdk.setMessageRead(id);
}

Future<void> deleteMessage(String id) async {
  await SFMCSdk.deleteMessage(id);
}

Future<void> markAllMessagesAsRead() async {
  await SFMCSdk.markAllMessagesRead();
}

Future<void> deleteAllMessages() async {
  await SFMCSdk.markAllMessagesDeleted();
}

String formatTime(DateTime sendDateUtc) {
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  String date = dateFormatter.format(sendDateUtc);
  final DateFormat timeFormatter = DateFormat('hh:mm a');
  String time = timeFormatter.format(sendDateUtc);
  return '$date $time';
}
