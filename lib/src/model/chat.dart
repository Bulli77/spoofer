
import 'package:chat_u/src/model/user.dart';

class Message {
  final User sender;
  final String time;
  final String? number;
  final String text;
  final bool unread;


  Message({
    required this.sender,
    required this.time,
     this.number,
    required this.text,
    required this.unread,
  });
}

List<Message> chats = [
  Message(
    sender: nikita,
    number: '16',
    time: '5:30 PM',
    text: 'Hey dude! Even dead I'+'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: rubby,
    time: '4:30 PM',
    number: '5',
    text: "Hi Tina. How's your night going?",
    unread: true,
  ),
  Message(
    sender: jessy,
    time: '3:30 PM',
    text: 'WOW! this soul world is amazing, but miss you guys.',
    unread: false,
  ),
  Message(
    sender: chawla,
    time: '2:30 PM',
    text: 'I\'m exposed now. Please help me to hide my identity.',
    unread: true,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: nikita,
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'We could surely handle this mess much easily if you were here.',
    unread: true,
  ),
 
  Message(
    sender: nikita,
    time: '3:15 PM',
    text: 'I\'m always proud of her and blessed to have both of them.',
    unread: true,
  ),


  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Yes Tony!',
    unread: true,
  ),
  Message(
    sender: nikita,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
  ),
];