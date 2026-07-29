local S = minetest.get_translator("compressed_coins")

compressed_coins = {}
compressed_coins.registered = {}

local function register_coin(def)

    -- Запам'ятовуємо опис монети
    compressed_coins.registered["compressed_coins:" .. def.name] = def

    -- Реєстрація предмета
    minetest.register_craftitem("compressed_coins:" .. def.name, {
        description = S(def.description),
        inventory_image = def.image,
        groups = {
            coin = 1,
            [def.name] = 1,
        },
        stack_max = def.stack_max or 99,
		
		on_use = function(itemstack, user)
			if not user or not user:is_player() then
				return itemstack
			end
			if not def.reverse then
				return itemstack
			end

			local inv = user:get_inventory()

			-- Перевіряємо, чи є місце
			for _, item in ipairs(def.reverse) do
				if not inv:room_for_item("main", ItemStack(item)) then
					minetest.chat_send_player(
						user:get_player_name(),
						S("Not enough space in inventory.")
					)
					return itemstack
				end
			end

			-- Забираємо одну монету
			itemstack:take_item()

			-- Повертаємо ресурси
			for _, item in ipairs(def.reverse) do
				inv:add_item("main", ItemStack(item))
			end

			return itemstack
		end,
    })

    -- Крафт
    if def.recipe then
        minetest.register_craft({
            output = "compressed_coins:" .. def.name .. " " .. (def.output or 1),
            recipe = def.recipe,
        })
    end
	
end

register_coin({
    name = "tin_coin",
    description = "Tin Coin",
    image = "compressed_coins_tin_coin.png",
    recipe = {
        {"default:tinblock", "default:tinblock", "default:tinblock"},
        {"default:tinblock", "default:tinblock", "default:tinblock"},
        {"default:tinblock", "default:tinblock", "default:tinblock"},
    },
    reverse = {
        "default:tinblock 9",
    }	
})

register_coin({
    name = "copper_coin",
    description = "Copper Coin",
    image = "compressed_coins_copper_coin.png",
    recipe = {
        {"default:copperblock", "default:copperblock", "default:copperblock"},
        {"default:copperblock", "compressed_coins:tin_coin", "default:copperblock"},
        {"default:copperblock", "default:copperblock", "default:copperblock"},
    },
    reverse = {
        "default:copperblock 8",
        "compressed_coins:tin_coin",
    }	
})

register_coin({
    name = "bronze_coin",
    description = "Bronze Coin",
    image = "compressed_coins_bronze_coin.png",
    recipe = {
        {"default:bronzeblock", "default:bronzeblock", "default:bronzeblock"},
        {"default:bronzeblock", "compressed_coins:copper_coin", "default:bronzeblock"},
        {"default:bronzeblock", "default:bronzeblock", "default:bronzeblock"},
    },
    reverse = {
        "default:bronzeblock 8",
        "compressed_coins:copper_coin",
    }	
})

register_coin({
    name = "steel_coin",
    description = "Steel Coin",
    image = "compressed_coins_steel_coin.png",
    recipe = {
        {"default:steelblock", "default:steelblock", "default:steelblock"},
        {"default:steelblock", "compressed_coins:bronze_coin", "default:steelblock"},
        {"default:steelblock", "default:steelblock", "default:steelblock"},
    },
    reverse = {
        "default:steelblock 8",
        "compressed_coins:bronze_coin",
    }	
})

register_coin({
    name = "gold_coin",
    description = "Gold Coin",
    image = "compressed_coins_gold_coin.png",
--    output = 4,
    recipe = {
        {"default:goldblock", "default:goldblock", "default:goldblock"},
        {"default:goldblock", "compressed_coins:steel_coin", "default:goldblock"},
        {"default:goldblock", "default:goldblock", "default:goldblock"},
    },
	    reverse = {
        "default:goldblock 8",
        "compressed_coins:steel_coin",
    }
})

register_coin({
    name = "diamond_coin",
    description = "Diamond Coin",
    image = "compressed_coins_diamond_coin.png",
    recipe = {
        {"default:diamondblock", "default:diamondblock", "default:diamondblock"},
        {"default:diamondblock", "compressed_coins:gold_coin", "default:diamondblock"},
        {"default:diamondblock", "default:diamondblock", "default:diamondblock"},
    },
	    reverse = {
        "default:diamondblock 8",
        "compressed_coins:gold_coin",
    }
})

