﻿using System;
using EloBuddy;
using EloBuddy.SDK;
using EloBuddy.SDK.Events;
using EloBuddy.SDK.Menu.Values;
using EloBuddy.SDK.Rendering;
using SharpDX;

namespace Kassadin
{
    class Program
    {
        static void Main(string[] args)
        {
            Loading.OnLoadingComplete += OnLoadingComplete;
        }

        private static void OnLoadingComplete(EventArgs args)
        {
            if (Player.Instance.Hero != Champion.Kassadin) return;

            Chat.Print("Kazuo's Kassadin Loaded!");

            Game.OnTick += Ontick;
            Game.OnUpdate += OnUpdate;
            Config.DesignMenu();
            Spells.LoadSpells();
            Drawing.OnDraw += OnDraw;
            Drawing.OnEndScene += DamageIndicator.Damage_Indicator;
            Gapcloser.OnGapcloser += Modes.Gapcloser_OnGapcloser;
            Interrupter.OnInterruptableSpell += Modes.InteruptSpells;
            Orbwalker.OnPostAttack += Modes.ResetAA;
        }

        public static readonly AIHeroClient KassDepTrai = ObjectManager.Player;

        private static void OnUpdate(EventArgs args)
        {
            Modes.DK();
        }

        private static void Ontick(EventArgs args)
        {
            if (Orbwalker.ActiveModesFlags.HasFlag(Orbwalker.ActiveModes.Combo))
            { Modes.DC(); }
            if (Orbwalker.ActiveModesFlags.HasFlag(Orbwalker.ActiveModes.Harass))
            { Modes.DH(); }
            if (Orbwalker.ActiveModesFlags.HasFlag(Orbwalker.ActiveModes.LaneClear))
            { Modes.DL(); }
            if (Orbwalker.ActiveModesFlags.HasFlag(Orbwalker.ActiveModes.JungleClear))
            { Modes.DJ(); }
            
        }

        private static void OnDraw(EventArgs args)
        {
            if (Config.DrawMenu["draw"].Cast<CheckBox>().CurrentValue)
            {
                if (Config.DrawMenu["Edr"].Cast<CheckBox>().CurrentValue)
                {
                    Circle.Draw(Spells.E.IsLearned ? Color.Yellow : Color.Zero, Spells.E.Range, Player.Instance.Position);
                }
                if (Config.DrawMenu["Rdr"].Cast<CheckBox>().CurrentValue)
                {
                    Circle.Draw(Spells.R.IsLearned ? Color.Yellow : Color.Zero, Spells.R.Range, Player.Instance.Position);
                }
            }
        }
    }
}