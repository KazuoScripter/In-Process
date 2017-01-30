using EloBuddy;
using EloBuddy.SDK;
using EloBuddy.SDK.Enumerations;

namespace Kassadin
{
    class Spells
    {
        public static Spell.Targeted Q;
        public static Spell.Active W;
        public static Spell.Skillshot E;
        public static Spell.Skillshot R;
        public static Spell.Targeted Ignite;
        //public static Spell.Targeted Smite;

        public static void LoadSpells()
        {
            Q = new Spell.Targeted(SpellSlot.Q, 650);
            W = new Spell.Active(SpellSlot.W);
            E = new Spell.Skillshot(SpellSlot.E, 585, SkillShotType.Cone)
            {
                AllowedCollisionCount = int.MaxValue
            };
            R = new Spell.Skillshot(SpellSlot.R, 500, SkillShotType.Circular)
            {
                AllowedCollisionCount = int.MaxValue
            };
            Ignite = new Spell.Targeted(ObjectManager.Player.GetSpellSlotFromName("SummonerIgnite"), 600);
            //Smite = new Spell.Targeted(ObjectManager.Player.GetSpellSlotFromName("SummonerSmite"), 500);
        }
    }
}