//New class that randomly outputs different conversations

class Text {



  String[][] conversations = { 
    { (""), ("Yo dude did you hear"), ("Yeah man"), ("My guess is we never see her again"), ("This is some stranger things type stuff man"), ("U scared?"), ("Who wouldn't be"), ("") }, 
    { (""), ("You hear about Alice?"), ("No what's good"), ("Apparently she's disappeared and her family is going nuts"), ("Nuts? I wouldn't blame them"), ("They're telling police Alice visits them through there phones and TV"), ("..."), ("") }, 
    { (""), ("Someone found our machine"), ("How do you know?"), ("I saw someone, lost in the Drome"), ("This is bad"), ("We should go get her out"), ("It's to dangerous"), ("") },
    { (""), ("We have to go get her out"), ("The Drome is to dangerous!"), ("But we don't know what will happen if she dies in there"), ("Which risk do you wanna take!"), ("..."), ("That's what I thought"), ("") },
    { (""), ("I can't let this kill someone"), ("Then go"), ("You gotta come to"), ("Nope"), ("We made this thing together! You don't have a choice"), ("..."), ("") },
    { (""), ("Alice is missing"), ("What!?"), ("I'm tripping out like crazy I'm so scared"), ("Tripping out how?"), ("I keep thinking I see her when I look at my phone!"), ("Shit, I'm coming over"), ("") },
    { (""), ("Whatever is happing at Alice's place is unnatural"), ("Yeah people at school have been saying some strange stuff"), ("Like what?"), ("That she's trapped in some cyber-dimension or something"), ("We should go"), ("To her house!?, noooo way"), ("") },
    { (""), ("Dude I have a bad feeling about this"), ("What's the worst that could happen?"), ("Idk disappear into whatever dimension Alice is stuck in or some shit!"), ("That's all just gossip I wanna see what's really going on"), ("Ok but my bad feeling ain't going away"), ("") }
  };
  int conversationIndex = 0;
  int lineIndex = 0;

  int x;
  int y;

  Text(int _x, int _y) {
    x = _x;
    y = _y;
    
    conversationIndex  = floor(random(0,conversations.length));
    
  }
//This makes it change text each time the ball hits the paddle
  void update(Ball ball, Paddle paddle) {

    boolean insideLeft = (ball.x + ball.SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (ball.x - ball.SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (ball.y + ball.SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (ball.y - ball.SIZE/2 < paddle.y + paddle.HEIGHT/2);

    if (insideLeft && insideRight && insideTop && insideBottom) {
      lineIndex = (lineIndex + 1);
      //This makes it play the video after the conversation is done
      if (lineIndex > 6) {
        movie.play();
        basicPong.returnToMenu = true;
      }
    }

    fill(255, 0, 0);
    textSize(20); 
    textAlign(CENTER, CENTER); 
    textLeading(64); 
    text(conversations[conversationIndex][lineIndex], x, y);
  }


  void display() {
    textSize(50);
    textAlign(CENTER, 420);
    fill(0, 60, 0);
    }
  }