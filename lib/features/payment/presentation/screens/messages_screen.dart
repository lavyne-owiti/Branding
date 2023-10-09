import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  static String routePath = '/messages';
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset('assets/images/emptyChat.png',
                color: Theme.of(context).primaryColor,
                width: MediaQuery.of(context).size.width * 0.32),
            //  chatMessages(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              color:const Color(0xffD2D2F1),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "send a message",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        border: InputBorder.none),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      // sendMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



  // chatMessages() {
  //   return StreamBuilder(
  //       stream: chats,
  //       builder: (context, AsyncSnapshot snapshot) {
          
  //         return snapshot.hasData
  //             ? ListView.builder(
  //                 itemCount: snapshot.data.docs.length,
  //                 itemBuilder: (context, Index) {
  //                   return MessageTile(
  //                       message: snapshot.data.docs[Index]['message'],
  //                       sender: snapshot.data.docs[Index]['sender'],
  //                       sendebyme: widget.userName ==
  //                           snapshot.data.docs[Index]['sender']);
  //                 })
  //             : Container();
  //       });
  // }

  // sendMessage() {
  //   if (messageController.text.isNotEmpty) {
  //     Map<String, dynamic> chatMessageMap = {
  //       "message": messageController.text,
  //       "sender": widget.userName,
  //       "time": DateTime.now().millisecondsSinceEpoch,
  //     };
  //     DatabaseService().sendMessage(widget.groupId, chatMessageMap);
  //     setState(() {
  //       messageController.clear();
  //     });
  //   }
  // }

