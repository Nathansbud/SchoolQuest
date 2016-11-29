/* Text Adventure 2: The Sequel (Working Title)
 
 A text adventure by  Zack.
 
 */

String storyline[];
String playerName = "", friendName = "", enemyName = "";
ArrayList<Screen> screens;
int currentScreen = 0;
int q = width/2;
int e = height/2;


void setup()
{
  fullScreen(P3D);
  storyline = loadStrings("textadventure.txt");
  screens = new ArrayList<Screen>();
  Parse();
}

void draw()
{
  if (screens.size() > 0)
  {
    screens.get(currentScreen).ScreenDraw();
  }
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

void Parse()
{
  for (int i = 0; i < storyline.length; i++)
  {
    if (storyline[i].equals("#"))
    {
      i++; 
      String title = storyline[i++];
      String text = "";
      while (storyline[i].charAt(0) != '>')
      {
        text += storyline[i];
        i++;
      }
      String currentLine = storyline[i].substring(1, storyline[i].length()); 
      String[] buttonText = new String[3];
      buttonText = split(currentLine, ",");
      i++;
      
      screens.add(new Screen(title, text, buttonText));
    }
  }
}