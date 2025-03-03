/////////////////// KEYRING ////////////////////

/obj/item/keyring
	name = "keyring"
	desc = "A circular ring of metal for hooking additional rings."
	icon_state = "keyring0"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0
	throwforce = 0
	var/list/keys = list()
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK|ITEM_SLOT_MOUTH|ITEM_SLOT_WRISTS
	experimental_inhand = FALSE
	dropshrink = 0.7

/obj/item/keyring/Initialize()
	. = ..()
	if(keys.len)
		for(var/X in keys)
			addtoring(new X())
			keys -= X
	update_icon()

/obj/item/keyring/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,
"sx" = -6,
"sy" = -3,
"nx" = 13,
"ny" = -3,
"wx" = -2,
"wy" = -3,
"ex" = 4,
"ey" = -5,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 15,
"sturn" = 0,
"wturn" = 0,
"eturn" = 39,
"nflip" = 8,
"sflip" = 0,
"wflip" = 0,
"eflip" = 8)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/keyring/proc/addtoring(obj/item/I)
	if(!I || !istype(I))
		return 0
	I.loc = src
	keys += I
	update_icon()
	update_desc()

/obj/item/keyring/proc/removefromring(mob/user)
	if(!keys.len)
		return
	var/obj/item/roguekey/K = keys[keys.len]
	keys -= K
	K.loc = user.loc
	update_icon()
	update_desc()
	return K

/obj/item/keyring/pre_attack(target, user, params)
	. = ..()
	var/used_hash
	if(istype(target, /obj/structure/closet))
		var/obj/structure/closet/C = target
		if(C.masterkey)
			used_hash = C.lockhash
	if(istype(target, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/D = target
		if(D.masterkey)
			used_hash = D.lockhash
	for(var/obj/item/roguekey/K in keys)
		if(istype(K, /obj/item/roguekey/lord))
			K.lockhash = used_hash

/obj/item/keyring/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/roguekey))
		if(keys.len >= 10)
			to_chat(user, "<span class='warning'>Too many keys.</span>")
			return
		user.dropItemToGround(I)
		addtoring(I)
	else
		return ..()

/obj/item/keyring/attack_right(mob/user)
	if(keys.len)
		to_chat(user, "<span class='notice'>I steal a key off the ring.</span>")
		var/obj/item/roguekey/K = removefromring(user)
		user.put_in_active_hand(K)

/obj/item/keyring/update_icon()
	..()
	if(!keys.len)
		icon_state = "keyring0"
		return
	if(keys.len >= 5)
		icon_state = "keyring5"
		return
	switch(keys.len)
		if(1)
			icon_state = "keyring1"
		if(2)
			icon_state = "keyring2"
		if(3)
			icon_state = "keyring3"
		if(4)
			icon_state = "keyring4"

/obj/item/keyring/proc/update_desc()
	if(keys.len)
		desc = "<span class='info'>\Roman [keys.len] keys.</span>"
	else
		desc = ""

/obj/item/lockpickring
	name = "lockpickring"
	desc = "A piece of bent wire to store lockpicking tools. Too bulky for fine work."
	icon_state = "pickring0"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0
	throwforce = 0
	var/list/picks = list()
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK|ITEM_SLOT_MOUTH|ITEM_SLOT_WRISTS
	experimental_inhand = FALSE
	dropshrink = 0.7

/obj/item/lockpickring/Initialize()
	. = ..()
	if(picks.len)
		for(var/X in picks)
			addtoring(new X())
			picks -= X
	update_icon()

/obj/item/lockpickring/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,
"sx" = -6,
"sy" = -3,
"nx" = 13,
"ny" = -3,
"wx" = -2,
"wy" = -3,
"ex" = 4,
"ey" = -5,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 15,
"sturn" = 0,
"wturn" = 0,
"eturn" = 39,
"nflip" = 8,
"sflip" = 0,
"wflip" = 0,
"eflip" = 8)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/lockpickring/proc/addtoring(obj/item/I)
	if(!I || !istype(I))
		return 0
	I.loc = src
	picks += I
	update_icon()
	update_desc()

/obj/item/lockpickring/proc/removefromring(mob/user)
	if(!picks.len)
		return
	var/obj/item/lockpick/K = picks[picks.len]
	picks -= K
	K.loc = user.loc
	update_icon()
	update_desc()
	return K

/obj/item/lockpickring/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/lockpick))
		if(picks.len >= 3)
			to_chat(user, "<span class='warning'>Too many lockpicks.</span>")
			return
		user.dropItemToGround(I)
		addtoring(I)
	else
		return ..()

/obj/item/lockpickring/attack_right(mob/user)
	if(picks.len)
		to_chat(user, "<span class='notice'>I steal a pick off the ring.</span>")
		var/obj/item/lockpick/K = removefromring(user)
		user.put_in_active_hand(K)

/obj/item/lockpickring/update_icon()
	..()
	if(!picks.len)
		icon_state = "pickring0"
		return
	if(picks.len >= 3)
		icon_state = "pickring3"
		return
	switch(picks.len)
		if(1)
			icon_state = "pickring1"
		if(2)
			icon_state = "pickring2"
		if(3)
			icon_state = "pickring3"

/obj/item/lockpickring/proc/update_desc()
	if(picks.len)
		desc = "<span class='info'>\Roman [picks.len] lockpicks.</span>"
	else
		desc = ""

/obj/item/lockpickring/mundane
	picks = list(/obj/item/lockpick, /obj/item/lockpick, /obj/item/lockpick)

/obj/item/keyring/captain
	keys = list(/obj/item/roguekey/captain, /obj/item/roguekey/dungeon, /obj/item/roguekey/garrison, /obj/item/roguekey/walls, /obj/item/roguekey/manor, /obj/item/roguekey/graveyard)

/obj/item/keyring/queen
	keys = list(/obj/item/roguekey/dungeon, /obj/item/roguekey/garrison, /obj/item/roguekey/walls, /obj/item/roguekey/manor, /obj/item/roguekey/queen)

/obj/item/keyring/guard
	keys = list(/obj/item/roguekey/dungeon, /obj/item/roguekey/garrison, /obj/item/roguekey/walls, /obj/item/roguekey/manor)

/obj/item/keyring/guardcastle
	keys = list(/obj/item/roguekey/dungeon, /obj/item/roguekey/garrison, /obj/item/roguekey/walls, /obj/item/roguekey/manor)

/obj/item/keyring/archivist
	keys = list(/obj/item/roguekey/archive, /obj/item/roguekey/manor)

/obj/item/keyring/merchant
	keys = list(/obj/item/roguekey/shop, /obj/item/roguekey/merchant)

/obj/item/keyring/mguard
	keys = list(/obj/item/roguekey/dungeon, /obj/item/roguekey/garrison, /obj/item/roguekey/walls, /obj/item/roguekey/manor)

/obj/item/keyring/mage
	keys = list(/obj/item/roguekey/manor, /obj/item/roguekey/tower, /obj/item/roguekey/mage)

/obj/item/keyring/innkeep
	keys = list(/obj/item/roguekey/tavern, /obj/item/roguekey/roomiv, /obj/item/roguekey/roomiii, /obj/item/roguekey/roomii, /obj/item/roguekey/roomi)

/obj/item/keyring/priest
	keys = list(/obj/item/roguekey/priest, /obj/item/roguekey/confession, /obj/item/roguekey/church, /obj/item/roguekey/monastery, /obj/item/roguekey/puritan)

/obj/item/keyring/puritan
	keys = list(/obj/item/roguekey/puritan, /obj/item/roguekey/manor, /obj/item/roguekey/dungeon, /obj/item/roguekey/confession, /obj/item/roguekey/church)

/obj/item/keyring/shepherd
	keys = list(/obj/item/roguekey/confession, /obj/item/roguekey/church)

/obj/item/keyring/niteman
	keys = list(/obj/item/roguekey/niteman, /obj/item/roguekey/nitemaiden)

/obj/item/keyring/hand
	keys = list(/obj/item/roguekey/hand, /obj/item/roguekey/steward, /obj/item/roguekey/tavern, /obj/item/roguekey/church, /obj/item/roguekey/walls, /obj/item/roguekey/dungeon, /obj/item/roguekey/garrison, /obj/item/roguekey/manor, /obj/item/roguekey/graveyard)

/obj/item/keyring/steward
	keys = list(/obj/item/roguekey/steward, /obj/item/roguekey/walls, /obj/item/roguekey/dungeon, /obj/item/roguekey/manor, /obj/item/roguekey/graveyard)

/obj/item/keyring/dungeoneer
	keys = list(/obj/item/roguekey/dungeon, /obj/item/roguekey/manor, /obj/item/roguekey/garrison, /obj/item/roguekey/walls)

/obj/item/keyring/servant
	keys = list(/obj/item/roguekey/manor, /obj/item/roguekey/garrison)

/obj/item/keyring/jester
	keys = list(/obj/item/roguekey/manor, /obj/item/roguekey/garrison, /obj/item/roguekey/theatre)

/obj/item/keyring/weaponsmith
	keys = list(/obj/item/roguekey/weaponsmith, /obj/item/roguekey/blacksmith)

/obj/item/keyring/armorsmith
	keys = list(/obj/item/roguekey/armorsmith, /obj/item/roguekey/blacksmith)

/obj/item/keyring/mayor
	keys = list(/obj/item/roguekey/garrison, /obj/item/roguekey/elder, /obj/item/roguekey/butcher, /obj/item/roguekey/soilson)
