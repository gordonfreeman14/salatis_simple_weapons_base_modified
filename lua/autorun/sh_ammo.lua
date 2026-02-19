-- 7.92mm Ammo
if CLIENT then
    language.Add("792sni_ammo", "7.92mm")
end
game.AddAmmoType( {
	name = "792sni",
	dmgtype = DMG_BULLET, 
	maxcarry = 20,

} )

-- 7.62x39 Ammo
if CLIENT then
    language.Add("762rif_ammo", "7.62x39")
end
game.AddAmmoType( {
	name = "762rif",
	dmgtype = DMG_BULLET, 
	maxcarry = 240,

} )

-- 5.56x45 Ammo
if CLIENT then
    language.Add("556rif_ammo", "5.56x45")
end
game.AddAmmoType( {
	name = "556rif",
	dmgtype = DMG_BULLET, 
	maxcarry = 240,

} )

-- FN 5.7×28mm Ammo
if CLIENT then
    language.Add("57sub_ammo", "FN 5.7×28mm")
end
game.AddAmmoType( {
	name = "57sub",
	dmgtype = DMG_BULLET, 
	maxcarry = 120,

} )

-- 12/70 Buckshot Ammo
if CLIENT then
    language.Add("1270buck_ammo", "12/70 Buckshot")
end
game.AddAmmoType( {
	name = "1270buck",
	dmgtype = DMG_BULLET, 
	maxcarry = 40,

} )

-- 12/70 Slug Ammo
if CLIENT then
    language.Add("1270slug_ammo", "12/70 Slug")
end
game.AddAmmoType( {
	name = "1270slug",
	dmgtype = DMG_BULLET, 
	maxcarry = 40,

} )

-- 9x19 Ammo
if CLIENT then
    language.Add("9x19pis_ammo", "9x19")
end
game.AddAmmoType( {
	name = "9x19pis",
	dmgtype = DMG_BULLET, 
	maxcarry = 120,

} )

-- .45 ACP Ammo
if CLIENT then
    language.Add("45pis_ammo", ".45 ACP")
end
game.AddAmmoType( {
	name = "45pis",
	dmgtype = DMG_BULLET, 
	maxcarry = 120,

} )

-- .357 Magnum Ammo
if CLIENT then
    language.Add("357pis_ammo", ".357 Magnum")
end
game.AddAmmoType( {
	name = "357pis",
	dmgtype = DMG_BULLET, 
	maxcarry = 30,

} )

-- .44 Magnum Ammo
if CLIENT then
    language.Add("44pis_ammo", ".44 Magnum")
end
game.AddAmmoType( {
	name = "44pis",
	dmgtype = DMG_BULLET, 
	maxcarry = 30,

} 
)
-- Rocket-propelled grenade
if CLIENT then
    language.Add("rpglau_ammo", "Rocket-propelled grenade")
end
game.AddAmmoType( {
	name = "rpglau",
	dmgtype = DMG_BLAST, 
	maxcarry = 14,

} )
