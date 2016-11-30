/* Text Adventure 2: The Sequel (Working Title) //<>//
 
 A text adventure by  Zack.
 
 */

String storyline[]; //Array of Text. This makes all the everything work.
String playerName = "", friendName = "", enemyName = ""; //Strings used for player-input names of "characters." These replace the @CharacterName markers used in the textadventure.txt file
ArrayList<Screen> screens; 
int currentScreen = 1; //Current screen in the screens ArrayList being shown
//boolean playerNameSelected;
//boolean friendNameSelected;
//boolean enemyNameSelected;
boolean mouseIsReleased; //Used to trigger button presses

void setup()
{
  fullScreen();
  screens = new ArrayList<Screen>();
  storyline = loadStrings("textadventure.txt");
  Parse(); 
}

void draw()
{
  if (screens.size() > 0) //Once screens are loaded in, draw them (the first is 1, and currentScreen is initially set to that value)
  {
    screens.get(currentScreen).Draw(); 
  }
  mouseIsReleased = false; //mouseIsReleased is continually set to false so that the releasing of mouse is only registered for one frame, else would trigger buttons at any time
}

void keyPressed() //Replaces all @CharacterNames with player-inputted ones. However, not fully finished yet (drawing-wise, doesn't prevent player from not naming characters)
{
  if (currentScreen == 1) 
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
  if (currentScreen == 11 || currentScreen == 13)
  {
    if (key == BACKSPACE)
    {
      if (friendName.length() > 0)
      {
        friendName = friendName.substring(0, friendName.length() - 1);
      }
    } else
      if (key != CODED && key != ENTER && friendName.length() <= 10)
      {
        friendName = friendName + key;
      }
  }
  if (currentScreen == 14)
  {
    if (key == BACKSPACE)
    {
      if (enemyName.length() > 0)
      {
        enemyName = enemyName.substring(0, enemyName.length() - 1);
      }
    } else
      if (key != CODED && key != ENTER && enemyName.length() <= 10)
      {
        enemyName = enemyName + key;
      }
  }
}

void Parse()
{
  for (int i = 0; i < storyline.length; i++)
  {
    if (storyline[i].equals("#") || storyline[i].equals("# "))
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

void mouseReleased()
{
  mouseIsReleased = true;
}