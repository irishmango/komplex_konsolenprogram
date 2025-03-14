import 'dart:io';

// Create Class
// ------------------------------------------

class Pokemon {
  final String number;
  final String name;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  Pokemon(this.number, this.name, this.hp, this.attack, this.defense, this.specialAttack, this.specialDefense, this.speed);

  void format() {
    print(
        "Pokedex No.: $number \nName: $name \nHP: $hp \nAttack: $attack \nDefense: $defense \nSpecial Attack: $specialAttack \nSpecial Defense: $specialDefense \nSpeed: $speed");
  }
}

// Create Functions
/*------------------------------------------*/

int numberInput = 0;

bool isNumeric(String str) {
  return int.tryParse(str) != null; // isNumeric(String str) is true when int.tryParse(str) is NOT null
}

void promptUser(Map<int, Pokemon> pokedex) {
	// Prompt message to the user
	print("\nEnter the Pokédex number (1 - 151), Pokémon name, or type 'exit' to quit:");

	// Read user input as a string
	String? input = stdin.readLineSync();

	// Check if the user didn't enter anything
	if (input == null || input.isEmpty) {
		print("Please enter something!");
		return promptUser(pokedex); // Restart the prompt
	}

	// Exit condition - if user types "exit", the program stops asking
	if (input.toLowerCase() == 'exit') {
		print("Goodbye, Trainer!");
		return; // Stops looping and exits the function
	}

	// Check if the user entered a number (i.e if isNumeric is true)
	if (isNumeric(input)) {
		// Convert the string input to an int
		int numberInput = int.tryParse(input)!;

		// Limit search to amount in Map pokedex
		if (numberInput > 151) {
		print("No Pokémon found for Pokedex number: $numberInput");
		return promptUser(pokedex); // Restart prompt
		}

		// Try to find the Pokémon by its number
		Pokemon? chosen = pokedex[numberInput]; // pokedex[numberInput] is equal to the value in the Map. numberInput is the key. And of course the values of the Map are of type Pokemon. And we declare these values as variable chosen.

		if (chosen != null) {
			// If found, display its stats
			chosen.format();
		} else {
			// If no Pokémon found at that number
			print("No Pokémon found for number: $numberInput");
		}

		return promptUser(pokedex); // Restart prompt after showing result or no result
	}

	// If the user input is not numeric, treat it as a name search
	String clearedInput = input.replaceAll(' ', '');

	// Bool to track if Pokemon is found
	bool found = false;

	// Loop through all Pokémon in the pokedex
	for (Pokemon pokemon in pokedex.values) {
		// Compare names ignoring spaces and casing
		if (pokemon.name.replaceAll(' ', '').toLowerCase() == clearedInput.toLowerCase()) {
			// If found, display Pokemon stats
			pokemon.format();
			found = true;
			break; // No need to search further
		}
	}

	if (!found) {
		// If no match found in the name search
		print("No Pokémon found with the name: $clearedInput");
	}

	// Restart prompt after search (whether found or not)
	promptUser(pokedex);
}

void main() {
  Map<int, Pokemon> pokedex = {
    1: Pokemon("001", "Bulbasaur", 45, 49, 49, 65, 65, 45),
    2: Pokemon("002", "Ivysaur", 60, 62, 63, 80, 80, 60),
    3: Pokemon("003", "Venusaur", 80, 82, 83, 100, 100, 80),
    4: Pokemon("004", "Charmander", 39, 52, 43, 60, 50, 65),
    5: Pokemon("005", "Charmeleon", 58, 64, 58, 80, 65, 80),
    6: Pokemon("006", "Charizard", 78, 84, 78, 109, 85, 100),
    7: Pokemon("007", "Squirtle", 44, 48, 65, 50, 64, 43),
    8: Pokemon("008", "Wartortle", 59, 63, 80, 65, 80, 58),
    9: Pokemon("009", "Blastoise", 79, 83, 100, 85, 105, 78),
    10: Pokemon("010", "Caterpie", 45, 30, 35, 20, 20, 45),
    11: Pokemon("011", "Metapod", 50, 20, 55, 25, 25, 30),
    12: Pokemon("012", "Butterfree", 60, 45, 50, 90, 80, 70),
    13: Pokemon("013", "Weedle", 40, 35, 30, 20, 20, 50),
    14: Pokemon("014", "Kakuna", 45, 25, 50, 25, 25, 35),
    15: Pokemon("015", "Beedrill", 65, 90, 40, 45, 80, 75),
    16: Pokemon("016", "Pidgey", 40, 45, 40, 35, 35, 56),
    17: Pokemon("017", "Pidgeotto", 63, 60, 55, 50, 50, 71),
    18: Pokemon("018", "Pidgeot", 83, 80, 75, 70, 70, 101),
    19: Pokemon("019", "Rattata", 30, 56, 35, 25, 35, 72),
    20: Pokemon("020", "Raticate", 55, 81, 60, 50, 70, 97),
    21: Pokemon("021", "Spearow", 40, 60, 30, 31, 31, 70),
    22: Pokemon("022", "Fearow", 65, 90, 65, 61, 61, 100),
    23: Pokemon("023", "Ekans", 35, 60, 44, 40, 54, 55),
    24: Pokemon("024", "Arbok", 60, 85, 69, 65, 79, 80),
    25: Pokemon("025", "Pikachu", 35, 55, 40, 50, 50, 90),
    26: Pokemon("026", "Raichu", 60, 90, 55, 90, 80, 110),
    27: Pokemon("027", "Sandshrew", 50, 75, 85, 20, 30, 40),
    28: Pokemon("028", "Sandslash", 75, 100, 110, 45, 55, 65),
    29: Pokemon("029", "Nidoran", 55, 47, 52, 40, 40, 41),
    30: Pokemon("030", "Nidorina", 70, 62, 67, 55, 55, 56),
    31: Pokemon("031", "Nidoqueen", 90, 92, 87, 75, 85, 76),
    32: Pokemon("032", "Nidoran♂", 46, 57, 40, 40, 40, 50),
    33: Pokemon("033", "Nidorino", 61, 72, 57, 55, 55, 65),
    34: Pokemon("034", "Nidoking", 81, 102, 77, 85, 75, 85),
    35: Pokemon("035", "Clefairy", 70, 45, 48, 60, 65, 35),
    36: Pokemon("036", "Clefable", 95, 70, 73, 95, 90, 60),
    37: Pokemon("037", "Vulpix", 38, 41, 40, 50, 65, 65),
    38: Pokemon("038", "Ninetales", 73, 76, 75, 81, 100, 100),
    39: Pokemon("039", "Jigglypuff", 115, 45, 20, 45, 25, 20),
    40: Pokemon("040", "Wigglytuff", 140, 70, 45, 85, 50, 45),
    41: Pokemon("041", "Zubat", 40, 45, 35, 30, 40, 55),
    42: Pokemon("042", "Golbat", 75, 80, 70, 65, 75, 90),
    43: Pokemon("043", "Oddish", 45, 50, 55, 75, 65, 30),
    44: Pokemon("044", "Gloom", 60, 65, 70, 85, 75, 40),
    45: Pokemon("045", "Vileplume", 75, 80, 85, 110, 90, 50),
    46: Pokemon("046", "Paras", 35, 70, 55, 45, 55, 25),
    47: Pokemon("047", "Parasect", 60, 95, 80, 60, 80, 30),
    48: Pokemon("048", "Venonat", 60, 55, 50, 40, 55, 45),
    49: Pokemon("049", "Venomoth", 70, 65, 60, 90, 75, 90),
    50: Pokemon("050", "Diglett", 10, 55, 25, 35, 45, 95),
    51: Pokemon("051", "Dugtrio", 35, 100, 50, 50, 70, 120),
    52: Pokemon("052", "Meowth", 40, 45, 35, 40, 40, 90),
    53: Pokemon("053", "Persian", 65, 70, 60, 65, 65, 115),
    54: Pokemon("054", "Psyduck", 50, 52, 48, 65, 50, 55),
    55: Pokemon("055", "Golduck", 80, 82, 78, 95, 80, 85),
    56: Pokemon("056", "Mankey", 40, 80, 35, 35, 45, 70),
    57: Pokemon("057", "Primeape", 65, 105, 60, 60, 70, 95),
    58: Pokemon("058", "Growlithe", 55, 70, 45, 70, 50, 60),
    59: Pokemon("059", "Arcanine", 90, 110, 80, 100, 80, 95),
    60: Pokemon("060", "Poliwag", 40, 50, 40, 40, 40, 90),
    61: Pokemon("061", "Poliwhirl", 65, 65, 65, 50, 50, 90),
    62: Pokemon("062", "Poliwrath", 90, 95, 95, 70, 90, 70),
    63: Pokemon("063", "Abra", 25, 20, 15, 105, 55, 90),
    64: Pokemon("064", "Kadabra", 40, 35, 30, 120, 70, 105),
    65: Pokemon("065", "Alakazam", 55, 50, 45, 135, 95, 120),
    66: Pokemon("066", "Machop", 70, 80, 50, 35, 35, 35),
    67: Pokemon("067", "Machoke", 80, 100, 70, 50, 60, 45),
    68: Pokemon("068", "Machamp", 90, 130, 80, 65, 85, 55),
    69: Pokemon("069", "Bellsprout", 50, 75, 35, 70, 30, 40),
    70: Pokemon("070", "Weepinbell", 65, 90, 50, 85, 45, 55),
    71: Pokemon("071", "Victreebel", 80, 105, 65, 100, 60, 70),
    72: Pokemon("072", "Tentacool", 40, 40, 35, 50, 100, 70),
    73: Pokemon("073", "Tentacruel", 80, 70, 65, 80, 120, 100),
    74: Pokemon("074", "Geodude", 40, 80, 100, 30, 30, 20),
    75: Pokemon("075", "Graveler", 55, 95, 115, 45, 45, 35),
    76: Pokemon("076", "Golem", 80, 120, 130, 55, 65, 45),
    77: Pokemon("077", "Ponyta", 50, 85, 55, 65, 65, 90),
    78: Pokemon("078", "Rapidash", 65, 100, 70, 80, 80, 105),
    79: Pokemon("079", "Slowpoke", 90, 65, 65, 40, 40, 15),
    80: Pokemon("080", "Slowbro", 95, 75, 110, 100, 80, 30),
    81: Pokemon("081", "Magnemite", 25, 35, 70, 95, 55, 45),
    82: Pokemon("082", "Magneton", 50, 60, 95, 120, 70, 70),
    83: Pokemon("083", "Farfetch'd", 52, 90, 55, 58, 62, 60),
    84: Pokemon("084", "Doduo", 35, 85, 45, 35, 35, 75),
    85: Pokemon("085", "Dodrio", 60, 110, 70, 60, 60, 110),
    86: Pokemon("086", "Seel", 65, 45, 55, 45, 70, 45),
    87: Pokemon("087", "Dewgong", 90, 70, 80, 70, 95, 70),
    88: Pokemon("088", "Grimer", 80, 80, 50, 40, 50, 25),
    89: Pokemon("089", "Muk", 105, 105, 75, 65, 100, 50),
    90: Pokemon("090", "Shellder", 30, 65, 100, 45, 25, 40),
    91: Pokemon("091", "Cloyster", 50, 95, 180, 85, 45, 70),
    92: Pokemon("092", "Gastly", 30, 35, 30, 100, 35, 80),
    93: Pokemon("093", "Haunter", 45, 50, 45, 115, 55, 95),
    94: Pokemon("094", "Gengar", 60, 65, 60, 130, 75, 110),
    95: Pokemon("095", "Onix", 35, 45, 160, 30, 45, 70),
    96: Pokemon("096", "Drowzee", 60, 48, 45, 43, 90, 42),
    97: Pokemon("097", "Hypno", 85, 73, 70, 73, 115, 67),
    98: Pokemon("098", "Krabby", 30, 105, 90, 25, 25, 50),
    99: Pokemon("099", "Kingler", 55, 130, 115, 50, 50, 75),
    100: Pokemon("100", "Voltorb", 40, 30, 50, 55, 55, 100),
    101: Pokemon("101", "Electrode", 60, 50, 70, 80, 80, 150),
    102: Pokemon("102", "Exeggcute", 60, 40, 80, 60, 45, 40),
    103: Pokemon("103", "Exeggutor", 95, 95, 85, 125, 65, 55),
    104: Pokemon("104", "Cubone", 50, 50, 95, 40, 50, 35),
    105: Pokemon("105", "Marowak", 60, 80, 110, 50, 80, 45),
    106: Pokemon("106", "Hitmonlee", 50, 120, 53, 35, 110, 87),
    107: Pokemon("107", "Hitmonchan", 50, 105, 79, 35, 110, 76),
    108: Pokemon("108", "Lickitung", 90, 55, 75, 60, 75, 30),
    109: Pokemon("109", "Koffing", 40, 65, 95, 60, 45, 35),
    110: Pokemon("110", "Weezing", 65, 90, 120, 85, 70, 60),
    111: Pokemon("111", "Rhyhorn", 80, 85, 95, 30, 30, 25),
    112: Pokemon("112", "Rhydon", 105, 130, 120, 45, 45, 40),
    113: Pokemon("113", "Chansey", 250, 5, 5, 35, 105, 50),
    114: Pokemon("114", "Tangela", 65, 55, 115, 100, 40, 60),
    115: Pokemon("115", "Kangaskhan", 105, 95, 80, 40, 80, 90),
    116: Pokemon("116", "Horsea", 30, 40, 70, 70, 25, 60),
    117: Pokemon("117", "Seadra", 55, 65, 95, 95, 45, 85),
    118: Pokemon("118", "Goldeen", 45, 67, 60, 35, 50, 63),
    119: Pokemon("119", "Seaking", 80, 92, 65, 65, 80, 68),
    120: Pokemon("120", "Staryu", 30, 45, 55, 70, 55, 85),
    121: Pokemon("121", "Starmie", 60, 75, 85, 100, 85, 115),
    122: Pokemon("122", "Mr. Mime", 40, 45, 65, 100, 120, 90),
    123: Pokemon("123", "Scyther", 70, 110, 80, 55, 80, 105),
    124: Pokemon("124", "Jynx", 65, 50, 35, 115, 95, 95),
    125: Pokemon("125", "Electabuzz", 65, 83, 57, 95, 85, 105),
    126: Pokemon("126", "Magmar", 65, 95, 57, 100, 85, 93),
    127: Pokemon("127", "Pinsir", 65, 125, 100, 55, 70, 85),
    128: Pokemon("128", "Tauros", 75, 100, 95, 40, 70, 110),
    129: Pokemon("129", "Magikarp", 20, 10, 55, 15, 20, 80),
    130: Pokemon("130", "Gyarados", 95, 125, 79, 60, 100, 81),
    131: Pokemon("131", "Lapras", 130, 85, 80, 85, 95, 60),
    132: Pokemon("132", "Ditto", 48, 48, 48, 48, 48, 48),
    133: Pokemon("133", "Eevee", 55, 55, 50, 45, 65, 55),
    134: Pokemon("134", "Vaporeon", 130, 65, 60, 110, 95, 65),
    135: Pokemon("135", "Jolteon", 65, 65, 60, 110, 95, 130),
    136: Pokemon("136", "Flareon", 65, 130, 60, 95, 110, 65),
    137: Pokemon("137", "Porygon", 65, 60, 70, 85, 75, 40),
    138: Pokemon("138", "Omanyte", 35, 40, 100, 90, 55, 35),
    139: Pokemon("139", "Omastar", 70, 60, 125, 115, 70, 55),
    140: Pokemon("140", "Kabuto", 30, 80, 90, 55, 45, 55),
    141: Pokemon("141", "Kabutops", 60, 115, 105, 65, 70, 80),
    142: Pokemon("142", "Aerodactyl", 80, 105, 65, 60, 75, 130),
    143: Pokemon("143", "Snorlax", 160, 110, 65, 65, 110, 30),
    144: Pokemon("144", "Articuno", 90, 85, 100, 95, 125, 85),
    145: Pokemon("145", "Zapdos", 90, 90, 85, 125, 90, 100),
    146: Pokemon("146", "Moltres", 90, 100, 90, 125, 85, 90),
    147: Pokemon("147", "Dratini", 41, 64, 45, 50, 50, 50),
    148: Pokemon("148", "Dragonair", 61, 84, 65, 70, 70, 70),
    149: Pokemon("149", "Dragonite", 91, 134, 95, 100, 100, 80),
    150: Pokemon("150", "Mewtwo", 106, 110, 90, 154, 90, 130),
    151: Pokemon("151", "Mew", 100, 100, 100, 100, 100, 100),
  };

  print("Hi Trainer!");
  print("Which Pokémon would you like to learn about today?");

  promptUser(pokedex);
}