/* Text Adventure 2: The Sequel (Working Title) //<>//
 
 A text adventure by  Zack.
 
 */

String storyline[];
String playerName = "", friendName = "", enemyName = "";
ArrayList<Screen> screens;
int currentScreen = 0;
int q, e;
boolean screenLoaded;

void setup()
{
  fullScreen(P2D);
  screens = new ArrayList<Screen>();
  storyline = loadStrings("textadventure.txt");
  Parse();
  q = width/2;
  e = height/2;
}

void draw()
{
  if (screens.size() > 0)// && currentScreen != 0)
  {
    screens.get(currentScreen).Draw();
  }
}

void keyPressed()
{
  if (currentScreen == 0)
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
        while (storyline[i].length() == 0)
        {
          storyline[i] = "\n\n";
        }
      }
      String currentLine = storyline[i].substring(1, storyline[i].length()); 
      String[] buttonText = new String[3];
      buttonText = split(currentLine, ", ");
      i++;
      int[] goesTo = new int[3];
      goesTo = int(split(storyline[i], ", "));
      screens.add(new Screen(title, text, buttonText, goesTo));
    }
  }
}

void mouseClicked()
{
}