# Compressed Coins

A simple resource compression mod for Luanti / Minetest.

Compressed Coins adds six craftable coins that provide a compact way to store valuable resources. Each higher-tier coin is crafted from resource blocks and the previous-tier coin, creating a simple progression system. Any coin can be converted back into the resources used to create it without requiring a crafting table.

## Features

* Six craftable coins:

  * Tin Coin
  * Copper Coin
  * Bronze Coin
  * Steel Coin
  * Gold Coin
  * Diamond Coin
* Progressive crafting system.
* Instant reverse conversion by using a coin.
* No crafting table required for reverse conversion.
* English and Ukrainian localization.
* Simple and lightweight implementation.
* Easy to extend with additional coin tiers.

## How It Works

Coins are crafted from resource blocks.

The first tier is crafted entirely from blocks, while every higher tier requires eight resource blocks and one coin from the previous tier.

Progression:

* Tin Coin = 9 Tin Blocks
* Copper Coin = 8 Copper Blocks + Tin Coin
* Bronze Coin = 8 Bronze Blocks + Copper Coin
* Steel Coin = 8 Steel Blocks + Bronze Coin
* Gold Coin = 8 Gold Blocks + Steel Coin
* Diamond Coin = 8 Diamond Blocks + Gold Coin

Using a coin instantly converts it back into the resources it contains.

## Installation

1. Download the mod.
2. Place the `compressed_coins` folder into your world's `mods` directory.
3. Enable the mod.
4. Start the game.

## Dependencies

* Minetest Game (`default`)

## Localization

Currently available languages:

* English
* Ukrainian

Contributions with additional translations are welcome.

## License

* **Code:** GPL-3.0
* **Textures:** CC BY-SA 4.0

## Author

Vasyl Onufriichuk
