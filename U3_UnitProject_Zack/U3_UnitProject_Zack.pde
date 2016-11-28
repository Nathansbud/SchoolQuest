/* Text Adventure 2: The Sequel (Working Title)
 
 A text adventure by  Zack.
 
 */

String storyLine[];
String playerName = "", friendName = "", enemyName = "";
String test = "test";
Screen screens[] = new Screen[100];

void setup()
{
  fullScreen(P3D);
  storyLine = loadStrings("textadventure.txt");
  screens[0] = new Screen("Start", "Help", "Quit", width/2, height/2, height/30, 0);
}

void draw()
{
  background(255);
  fill(0);
  textSize(20);
  text(storyLine[4], width/50, height/30, width - width/50, height/3*4);
  //storyLine.replaceAll(,);
  println(playerName);
  text("What will the name of this young man be? " + playerName, width/3, height/2);
  storyLine[4] = storyLine[4].replaceAll("@PlayerName", playerName);
  println(storyLine[4]);
}

void keyPressed()
{
  if (key == BACKSPACE)
  {
    if (playerName.length() > 0)
    {
      playerName = playerName.substring(0, playerName.length() - 1);
    }
  } else
    if (key != CODED && key != ENTER && playerName.length() <= 10)
    {
      playerName = playerName + key;
    }
}

void mouseClicked()
{
}