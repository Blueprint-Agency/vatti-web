-- The eWarranty dropdowns, read out of the live WPForms markup at
-- https://vattimalaysia.com/vatti-ewarranty/ (form 1879) on 15 Aug 2026.
-- Hand-authored rather than generated: the source is one page of one plugin's
-- HTML, it changes when the client signs a dealer, and an importer for it would
-- be more code than the list.
--
-- Four things were cleaned on the way in, and nothing else:
--
--  1. `DE BATHLABZ SDN BHD` appears twice in the source select. Kept once.
--     That is why this is 79 rows and the plan says 80.
--  2. `&amp;` decoded back to `&`, and a stray U+206F inside
--     `WPC ⁯IDEAS ENTERPRISE` removed. Both are markup artefacts, not names.
--  3. Sorted alphabetically. The source order is almost-alphabetical and then
--     is not — DE HOMEBIZ before DARSON, Filken Kulai before FILKEN BUKIT
--     INDAH — which in a 79-option select means the visitor scans it twice.
--     Ordering is done in the query (ORDER BY name COLLATE NOCASE), so there is
--     no sort_order column here to drift out of step with it.
--  4. Built-in oven codes are the catalogue's `O7549` and `O7559`, not the
--     form's `O07549` and `07559`. Those two are typos in WPForms — the same
--     transposed zero that produced the wrong live product slug recorded in
--     CLAUDE.md § Gotchas. The slug has to stay wrong because it is a URL;
--     a dropdown label does not, and the code is what a service engineer
--     matches against the plate on the appliance.

INSERT INTO warranty_dealer (name) VALUES
  ('ADAMAS TRADING (M) SDN. BHD.'),
  ('ALAT DAPUR CHERAS'),
  ('ALAT DAPUR SEMENYIH'),
  ('ALAT DAPUR Shah Alam'),
  ('BAN HIN BEE SDN BHD ( KITCHENTECH)'),
  ('BENOVA MARKETING SDN BHD'),
  ('BRIGHT SCOTT ELECTRICAL SDN BHD (PRIMA SQUARE)'),
  ('Bright Scott Electrical Sdn Bhd Sandakan'),
  ('CASA SANITARY SDN.BHD.'),
  ('DARSON ELECTRONICS SDN BHD ( EMART )'),
  ('DE BATHLABZ (BATU TIGA) SDN BHD'),
  ('DE BATHLABZ SDN BHD'),
  ('DE HOMEBIZ SDN BHD'),
  ('E.S.H ELECTRICAL SDN. BHD. (EkoCheras)'),
  ('E.S.H ELECTRICAL SDN. BHD. (Metro Prima)'),
  ('E.S.H ELECTRICAL SDN. BHD. (The Starling)'),
  ('EASTONE GALLERY & MARKETING'),
  ('EASTONE GALLERY SDN BHD'),
  ('Eastone Gallery Sdn Bhd – Tunjung'),
  ('ELLE ONNI TRADING'),
  ('EMART (NUSA BESTARI)'),
  ('EMART (PLENTONG)'),
  ('ESH ELECTRICAL SDN BHD'),
  ('ESH ELECTRICAL SDN BHD (Petaling Jaya)'),
  ('EUROTAN ENTERPRISE SDN BHD'),
  ('FELICITA HOMES DECO'),
  ('FILKEN BUKIT INDAH'),
  ('Filken Kulai'),
  ('Flo Plus Home Sdn Bhd'),
  ('GRAND FILKEN SETIA INDAH'),
  ('HENG FOONG SANITARYWARE TRADING'),
  ('HK HOME ELECTRICAL SDN.BHD.'),
  ('HOME CARE KITCHEN SUPPLY SDN BHD'),
  ('HOMEWORKS (SOUTHERN) SDN. BHD.'),
  ('HOMEWORKS SDN BHD'),
  ('IN CERAMICS SDN.BHD'),
  ('JF HOME APPLIANCES SDN BHD'),
  ('JW SANITARY HOME SDN BHD'),
  ('Kah Hoe Enterprise'),
  ('KBO MEGASTORE SDN BHD (JINJANG)'),
  ('Kbo Megastore Sdn Bhd (Kuchai Lama)'),
  ('KBO MEGASTORE SDN BHD (SEMENYIH)'),
  ('KBO MEGASTORE SDN BHD (UPTOWN)'),
  ('KBO TOTAL HOME DIY SDN BHD'),
  ('Kitchenwise Sdn Bhd'),
  ('LIVING PORTAL (M) SDN BHD'),
  ('LTL Global'),
  ('MANDI B.P. SDN BHD'),
  ('MULTI SKILL KITCHEN DESIGN SDN BHD'),
  ('MUM KITCH (BANDAR SUNWAY)'),
  ('MUM KITCH (BUKIT JALIL)'),
  ('Nikko Kitchen & Design (Melaka)'),
  ('Nikko Kitchen & Design (Muar)'),
  ('NOVO BATH HOME SDN BHD'),
  ('P&Y LIGHTING SDN BHD'),
  ('PERFECT ELECTRICAL SETIA ALAM'),
  ('PERFECT ELECTRICAL USJ TAIPAN'),
  ('SIN JIN DA HARDWARE SDN.BHD.'),
  ('SK HARDWARE -(KUCHING) SDN BHD'),
  ('SK HARDWARE SDN BHD ( BINTULU)'),
  ('SK LIFESTYLES (MIRI) SDN.BHD'),
  ('STANDARD KITCHEN SDN.BHD.'),
  ('TAHOL MARKETING'),
  ('TAI & TAI -TAWAU SDN.BHD.'),
  ('TANRADIO (JOHOR JAYA)'),
  ('TANRADIO.COM (Batu Pahat)'),
  ('TANRADIO.COM (KULAI)'),
  ('TANRADIO.COM (SERI ALAM)'),
  ('TANRADIO.COM (TUN AMINAH)'),
  ('TANRADIO.COM ELECTRICAL SDN BHD'),
  ('THYE HIN TRADING (M) SDN BHD'),
  ('UNION MOTORS & ELECTRICAL SUPPLIES SDN. BHD.'),
  ('URBANEZ SDN BHD'),
  ('Vatti Flagship Store Atria Mall'),
  ('VINTAGE BATH & KITCHEN KOTA KINABALU'),
  ('Vintage Bath & Kitchen Tawau'),
  ('WORLD BATH & KITCHEN SDN BHD'),
  ('WPC IDEAS ENTERPRISE'),
  ('XAM-MAX ENTERPRISE SDN BHD');

-- Source order, which is the order the appliances matter in and not
-- alphabetical: the hood and the hob are what most registrations are for.
INSERT INTO warranty_product_type (id, name, sort_order) VALUES
  (1, 'Hood', 1),
  (2, 'Hob', 2),
  (3, 'Built-in Oven', 3),
  (4, 'Combi Oven', 4),
  (5, 'Steam Oven', 5),
  (6, 'Microwave', 6),
  (7, 'Dishwasher', 7),
  (8, 'One Tap Water Purifier', 8);

-- Model codes, in the source select's order. V917 ships in two colourways with
-- byte-identical specs (CLAUDE.md § Gotchas); they stay two options here
-- because a warranty claim has to name the unit that is actually in the kitchen.
INSERT INTO warranty_model (type_id, code, sort_order) VALUES
  (1, 'V931', 1),
  (1, 'V935', 2),
  (1, 'V936', 3),
  (1, 'V937', 4),
  (1, 'V991', 5),
  (1, 'V993', 6),
  (1, 'V995', 7),
  (1, 'V996', 8),
  (1, 'V999', 9),
  (1, 'V998', 10),
  (1, 'V919', 11),
  (1, 'V997', 12),
  (1, 'V929', 13),
  (1, 'V960', 14),
  (1, 'V938', 15),
  (1, 'V917 (White)', 16),
  (1, 'V917 (Carbon Grey)', 17),

  (2, 'C836G', 1),
  (2, 'C835G', 2),
  (2, 'C720S', 3),
  (2, 'M821G', 4),
  (2, 'C821G', 5),
  (2, 'C822G', 6),
  (2, 'C830G', 7),
  (2, 'C861G', 8),
  (2, 'C823G', 9),
  (2, 'M822G', 10),
  (2, 'ER5902T', 11),
  (2, 'ER3601T', 12),

  (3, 'O755P', 1),
  (3, 'O7549', 2),
  (3, 'O7559', 3),

  (4, 'VA01', 1),
  (4, 'VA03', 2),
  (4, 'VA04', 3),
  (4, 'VA05', 4),
  (4, 'VA06', 5),

  (5, 'Z4501', 1),

  (6, 'M626', 1),

  (7, 'DWBB7', 1),

  (8, 'WDHG01 + V818WD', 1);
