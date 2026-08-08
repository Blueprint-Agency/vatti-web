-- Transcriptions of the marketing copy baked into the product images.
-- Source of truth, hand-authored and hand-editable — NOT generated from a scrape.
-- Runs after products.sql (db-build.mjs pins *-captions.sql last) and UPDATEs the
-- product_image rows it INSERTs, keyed on slug + position, never on integer ids.
--
-- Images with no overlaid text are deliberately absent: caption_md stays NULL.
-- Wording is verbatim from the pixels, including the source site's own English
-- errors ("Hitting-proof Design", "Categroy", "3050³/h"). Do not "fix" them here.

-- athena-series-lifting-type-range-hood-v993 — 5 of 9 images carry text
-- 2023/11/V993-Kitchen-Hood-2.webp
UPDATE product_image SET caption_md = '### Aesthetic & Industrial Design

Integrated Finishing

Brushed Stainless Steel, Laser Seamless Welding

Elegance Design & For Easy Cleaning.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993') AND position = 4;
-- 2023/11/V993-Kitchen-Hood-3.webp
UPDATE product_image SET caption_md = '### Laser Seamless Welding

Whole-process laser seamless welding by robotic arm,precise laser pulse making sure the welding of each board in integrated effect.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993') AND position = 5;
-- 2023/11/V993-Kitchen-Hood-4.webp
UPDATE product_image SET caption_md = '### Curved Body Finishing

Elegant Filament Curved Corners, Hitting-proof Design.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993') AND position = 6;
-- 2023/11/V993-Kitchen-Hood-6.webp
UPDATE product_image SET caption_md = '### Water-Proof Motor

Better Suction Performance, Safer Auto-clean.

Lower Working Temperature, More Durable Life Service

Less Noise, Better Cooking Environment

Segregate Water & Oil'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993') AND position = 7;
-- 2023/11/V993-Kitchen-Hood-7.webp
UPDATE product_image SET caption_md = '### Product Highlights

VATTI "Athena Series" Lifting Type Range Hood J663BH

### Lifting Type Air Inlet Design

Closer Air Inlet Exhausting Smoke Before Spreading

### Closer Air Inlet, Close to Smoke Source

Large Suction, Close to Smoke, Exhausting Before Speading

### Flow Deflecting Oil Filter Design

Fluid-type Filter Net for Better Oil & Smoke Separation

### Turbo Suction

Turbo function is Available for Wok and Deep-fry'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993') AND position = 8;

-- athena-series-lifting-type-range-hood-v999 — 7 of 10 images carry text
-- 2023/11/Vatti-Kitchen-Hood-V999-1.webp
UPDATE product_image SET caption_md = '### THE FIRST SIDE HOOD IN THE WORLD

### THE DOME HOLDS THE SMOKE CHAMBER

SMOKE HUNTING PERFORMANCE +50%'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999') AND position = 3;
-- 2023/02/PG3.gif
UPDATE product_image SET caption_md = '- LARGE WIDE ANGLE COVERS OIL FUMES WELL.
- OIL FUMES ARE ABSORBED IN ALL DIRECTIONS BY WIDE ANGLE.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999') AND position = 4;
-- 2023/07/PG5.gif
UPDATE product_image SET caption_md = '### VATTI V999 INVERTOR DC MOTOR

UP TO 1000Pa STATIC PRESSURE
ADVANCED TECHNOLOGY WITH A STRONG INVERTER MOTOR BRINGS A HIGHER UNRESTRICTED AIRFLOW 2500m3/h SUCTION POWER WITH NOISE LEVEL 52dB.

### AI SMART INTELLIGENT SUCTION

THE LARGER THE AIR VOLUME,
THE FASTER THE SUCTION POWER.

THE HIGHER THE WIND PRESSURE, THE FASTER THE SMOKE IS EXHAUSTED.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999') AND position = 5;
-- 2023/07/PG7.gif
UPDATE product_image SET caption_md = '### VATTI NEW GENERATION PRESSURE STEAM & HOT WASH AUTO CLEAN COOKER HOOD

HIGH PRESSURE STEAM AUTO CLEAN

### STEP 1

110 ℃ STEAMED GAS GREASE MELTING

110℃ HIGH TEMPERATURE STEAM MELT OIL

### STEP 2

80 ℃ HIGH PRESSURE HOT WATER SCOURING

HIGH PRESSURE 80℃ HOT WATER

### STEP 3

30SEC HIGH SPEED DRY MOTOR

30 SEC HIGH SPEED ROTATING & INDEPENDENT AIR-DRYING'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999') AND position = 6;
-- 2023/02/PG-2.gif
UPDATE product_image SET caption_md = '### WHAT IS THE BEST COOKER HOOD DESIGN FOR YOUR KITCHEN ?

T SHAPE

- GATHER THE SMOKE CAVITY
- SUCTION EFFICIENCY
- HEAD KNOCK
- COMFORTABLE

SIDE SHAPE

- GATHER THE SMOKE CAVITY
- SUCTION EFFICIENCY
- HEAD KNOCK
- COMFORTABLE

### VATTI COOKER HOOD V999 THE DOMES HOLD THE SMOKE CHAMBER DESIGN

VATTI V999

- GATHER THE SMOKE CAVITY
- SUCTION EFFICIENCY
- HEAD KNOCK
- COMFORTABLE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999') AND position = 7;
-- 2023/07/PG4.gif
UPDATE product_image SET caption_md = '### R80 CURVED BODY SHAPE

Motion Smoke Deflector, Quick Smoke Exhaust
Coanda Effect Practise, Quick Catching Smoke

R80 CURVED DESIGN

### HAND SENSOR CONTROL

WAVE TO CONTROL SMOKE

- USERFRIENDLY JUST WAVING YOUR HAND TO CONTROL YOUR COOKER HOOD.
- WITHOUT EXPERIENCING FINGERPRINTS OR OIL MARKS.
- EASY MAINTENANCE.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999') AND position = 8;
-- 2023/07/PG8.gif
UPDATE product_image SET caption_md = '### WATER-PROOF MOTOR

- SEGREGRATE WATER & OIL
- LOWER WORKING TEMPERATURE MORE DURABLE LIFE SERVICE
- LESS NOISE BETTER COOKING ENVIRONMENT'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999') AND position = 9;

-- athena-series-lifting-type-range-hood-v936 — 10 of 13 images carry text
-- 2023/11/V936-Product-Detail-2.webp
UPDATE product_image SET caption_md = '### 01

### Classic Tower Type Look

Inspiration From Eiffel Tower'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 3;
-- 2023/11/V936-Product-Detail-3.webp
UPDATE product_image SET caption_md = '### 02

### "R" Arc Edges and Corner

Elegant Filament Curved Corners, Hitting-proof Design'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 4;
-- 2023/11/V936-Product-Detail-6.webp
UPDATE product_image SET caption_md = '### 01

Double Cavities, Double Negative Pressure Zones, More Efficient Suction'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 5;
-- 2023/11/V936-Product-Detail-8.webp
UPDATE product_image SET caption_md = '### Patent Smoke Exhaust Technology

### 01

450Pa Powerful Negative Pressure Zone Exhausting Smoke Before Escaping'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 6;
-- 2023/11/V936-Product-Detail-10.webp
UPDATE product_image SET caption_md = '### New Generation Steam & Hot Water Auto Clean

Clean Interior Keeps Everlasting Suction Performance

### 01

125 Times Steam Oil Melting & High Pressure Hot Water Scouring'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 7;
-- 2023/11/V936-Product-Detail-1.webp
UPDATE product_image SET caption_md = '### Gathering Makes Cleaning

VATTI "Artemis Series" Tower Type Range Hood V936

- Classic Look
- Extended Range Gathering
- Deeper Range Cavity
- Patent Housing
- New Auto-clean'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 8;
-- 2023/11/V936-Product-Detail-4.webp
UPDATE product_image SET caption_md = '### Extended Hood Range Smoke Gathering

Larger Air Inlet Exhausting Smoke Before Escaping

- 98mm

### 01

98mm Deeper Hood Cavity Creates Larger Negative Pressure Zone, Avoiding Smoke Escaping Extended Oil Filter'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 9;
-- 2023/11/V936-Product-Detail-5.webp
UPDATE product_image SET caption_md = '### 02

35mm Deeper 3D Filter Area Constructs Second Negative Pressure Zone for More Powerful Suction Performance

- 3.5cm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 10;
-- 2023/11/V936-Product-Detail-9.webp
UPDATE product_image SET caption_md = '### 02

Patent V Shape Motor Housing Better Performance for More Fluent Smoke Removal

-ZL201320743850.1

V Shape Angie'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 11;
-- 2023/11/V936-Product-Detail-11.webp
UPDATE product_image SET caption_md = '### 03

30"+30" Ultra-speed Cleaning & Spin-dry

### 02

18" Continuous Hot Water Scouring'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936') AND position = 12;

-- athena-series-lifting-type-range-hood-v991 — 2 of 5 images carry text
-- 2023/11/Slide2.webp
UPDATE product_image SET caption_md = '### Hand Gestures Smart Control, Swing Hand and Say Goodbye to Smoke

Swing hand from left to right to adjust the suction volume-

1st hand swing to turn on the light and suction

2nd hand swing to start the turbo suction

3rd hand swing to return to the second volume;

Swing hand from right to leftto close the machine.

### Automatic Smoke Baffle Plate, No Smoke Escape

Open Baffle Plate to Segregate Escaping Smoke from Face

Close Baffle Plate to Segregate Smoke Leak from Center Tunnel'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991') AND position = 3;
-- 2023/11/Slide4.webp
UPDATE product_image SET caption_md = '### Patent V Shape Housing

Better Performance for More Fluent Smoke Removal

### Elegance Design

1. Shining Piano Black Body, Very Easy for Cleaning
2. Champagne Golden Decoration Line'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991') AND position = 4;

-- triple-intake-series-t-type-cooker-hood-v937 — 9 of 12 images carry text
-- 2023/11/v937-1.webp
UPDATE product_image SET caption_md = '### VATTI "BRILLIANCE SERIES" SMART RANGE HOOD V937

1 : 5 : 1

TRIPLE HOOD CAVITY

2500M3/H

TURBO SUCTION

200w

DC MOTOR

1050Pa

AIR PRESSURE

Thorough

AUTO-CLEAN TECHNOLOGY

46dB

LOW NOICE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 3;
-- 2023/11/V937-3.webp
UPDATE product_image SET caption_md = '### SMART SUCTION

Automatically match the exhaust air pressure, intelligently match the required air pressure according to the air resistance of the central tunnel

Use low air pressure for low air resistance, energy saving and noise reduction; high air pressure for high air resistance, flash suction and strong exhaust.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 4;
-- 2023/11/V937-5.webp
UPDATE product_image SET caption_md = '### 4 steps to open a new clean world

01 Remove the oil cup under the hood;

02 Replace with the cleaning water cup after adding water;

03 Press the auto-clean key for 1s to start cleaning;

04 Pour out the dirty water and install the oil cup

### Easy to disassemble the oil filter:

easy to disassemble, efficiently separate grease, and efficiently clean the filter with one wipe

- Airfoil suspended siphon cavity
- Oval oil filter
- Fully disassembled main oil filter design'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 5;
-- 2023/11/V937-7.webp
UPDATE product_image SET caption_md = '### LED soft light:

enlighten your cooking

### First-level energy efficiency,

energy saving and environmental friendly

### Detachable oil filter:

easy to disassemble and convenient to clean

Touch once to automatically delay 3 seconds to shut down, touch twice to shut down immediately

Long press for 3 seconds to automatically lock the screen, easy to clean and avoid accidental touch

Hand gesture smart control

A large oil cup is installed at the rear to avoid frequent pouring of oil

### 2nd chimney,

easy to install'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 6;
-- 2023/11/V937-8.webp
UPDATE product_image SET caption_md = '### SPECIFICATION

- 400
- 396
- 2nd Chimney
- 908
- 86
- 32
- 896
- 325 With back feet
- 322
- 0~320
- 588
- 500
- 512 With back feet'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 7;
-- 2023/11/V937-2.webp
UPDATE product_image SET caption_md = '### 1:5:1 FLYING WING THREE-CAVITY

Multi-level powerful instant suction, powerful suction capability

Innovative V-Power wide-area three-deep cavity, expanded negative pressure zone: super large area fully covers the cooking space

VATTI three-cavity hood

Traditional one-cavity hood'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 8;
-- 2023/11/V937-4.webp
UPDATE product_image SET caption_md = '### THREE-DIMENSION AUTO SELF-CLEANING

Cleaner interior, stronger suction capability

Frequency conversion auto-clean

Fully disassemble the main oil filter

Oleophobic floating silver painting

Frequency conversion auto-clean: brand new steamed auto-clean'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 9;
-- 2023/11/V937-6.webp
UPDATE product_image SET caption_md = '### THREE-DIMENSIONAL NOISE REDUCTION

Enjoy every moment of cooking quietly

One-dimensional: reduce mechanical noise

Frequency conversion chip, ball bearing

Two-dimensional: reduce aerodynamic noise

Patented V-shaped housing

Three-dimensional: suppress noise transmission

Porous sound-absorbing and noise-reducing materials

40dB Library

46dB* VATTI range hood

60dB Normal conversation

70dB Noisy street'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 10;
-- 2023/11/V937-9.webp
UPDATE product_image SET caption_md = '- Telescopic duct
- 300 Ceiling
- Φ190
- ≥120
- 400
- 588
- ≥5
- 896
- 910
- 650~700
- 133
- 325
- 512

Front view

Side view

- 83
- Φ190
- 133
- Φ185
- Φ180

Schematic diagram of cabinet ceiling openings (top view)

Schematic diagram of the length of the telescopic pipe

Unit: mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937') AND position = 11;

-- vatti-slim-series-type-range-hood-v996 — 8 of 11 images carry text
-- 2023/11/V996-PG1.jpg
UPDATE product_image SET caption_md = '### 3D COMBI SIDE & TOP INLET STRUCTURE, SLIM BODY BUT POWERFUL PERFORMANCE

VATTI "Domain Series" Smart Range Hood V996'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996') AND position = 3;
-- 2023/11/V996-PG3.jpg
UPDATE product_image SET caption_md = '### 500Pa

Big Static Pressure

No fear of smoke exhaust resistance from central tunnel: no backflow, no smoke blockage, and freely handles the cooking rush hours.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996') AND position = 4;
-- 2023/11/V996-PG5.jpg
UPDATE product_image SET caption_md = '### HEAT AUTO CLEAN

17 minutes cleaning process

17min

01 The first high temperature heating — 3min

02 Continuous heating to peel off oil stains — 2min

03 The high speed fan running and throws off oil — 30 second

04 The second high temperature heating deeply dissolves oil stains — 5min

05 The high speed fan running for deep oil removal — 30 second

06 The third high temperature heating dissolves stubborn oil stains — 5min

07 The high speed fan running for drying inner cabinet — 1min'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996') AND position = 5;
-- 2023/11/V996-PG7.jpg
UPDATE product_image SET caption_md = '### New side & top inlet structure, new art of aesthetics

Better fit with cabinets

Simple and fashionable'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996') AND position = 6;
-- 2023/11/V996-PG2.jpg
UPDATE product_image SET caption_md = '### NEW 3D SIDE & TOP SUCTION INLET

The top suction inlet collects smoke steadily and captures rising oil smoke.

The side suction inlet is lower and the smoke collects faster.

345mm

345cm narrowed depth, fits the cabinet

720cm large space, does not block the view, can fit for tall pots'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996') AND position = 7;
-- 2023/11/V996-PG4.jpg
UPDATE product_image SET caption_md = '### HAND SENSOR CONTROL

From left to right: turn on the machine and adjust the air volume

From right to left: turn off the machine'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996') AND position = 8;
-- 2023/11/V996-PG6.jpg
UPDATE product_image SET caption_md = '### Removable smoke guide plate

### Hook-type embedded design,

Easy to disassemble with one lift and push, simple and quick cleaning, comprehensively improve the use experience.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996') AND position = 9;
-- 2023/11/V996-PG8.jpg
UPDATE product_image SET caption_md = '### Installation View

Unit:(mm)

- Telescopic duct
- Ceiling
- 210
- 400
- ≥5
- 896
- 300-380
- 800~850
- 45
- 297
- 450
- 78
- 420
- 360 (With back feet)
- 186
- Φ190
- 83
- Φ185
- Φ180

Schematic diagram of cabinet ceiling openings (top view)

Schematic diagram of the length of the telescopic pipe'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996') AND position = 10;

-- vatti-magic-series-cooker-hood-v919 — 13 of 16 images carry text
-- 2024/04/Slide1.jpg
UPDATE product_image SET caption_md = '### 超薄机身大吸力

### SLIM TYPE COOKER HOOD'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 3;
-- 2024/04/Slide4.jpg
UPDATE product_image SET caption_md = '### ULTRA-THIN BODY INTEGRATED WITH CABINETS

- 270mm - 330mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 4;
-- 2024/04/Slide8.jpg
UPDATE product_image SET caption_md = '### INTELLIGENT VOLUME ADJUSTABLE SUCTION

Equipped with the intelligent volume adjustable suction, it monitors the resistance of central tunnel in real time, automatically adjusts the appropriate wind pressure and air volume, and easily copes with the resistance of central tunnel during peak cooking periods, making cooking more worry-free.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 5;
-- 2024/04/Slide5.jpg
UPDATE product_image SET caption_md = '### Large suction power 3050m³/h'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 6;
-- 2024/04/Slide11.jpg
UPDATE product_image SET caption_md = '### Steam Washing Technology

- STEAM WASHING TECHNOLOGY
- CONTINUOUS FLUSHING WITH HIGH-PRESSURE HOT WATER
- HIGH-SPEED OIL AND AIR DRYING'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 7;
-- 2024/04/Slide10.jpg
UPDATE product_image SET caption_md = '### Four Step to Get a New Hood

1. Take off oil cup at the bottom of hood
2. Put on water cup with water on the rack
3. 1-key auto-clean, start auto-clean
4. Pour off water cup, put on oil cup back'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 8;
-- 2024/04/Slide13.jpg
UPDATE product_image SET caption_md = '### Specification

- Model No.: V919
- Noise Level: 50dB
- Turbo Suction Capacity: 3050³/h
- Rated Static Pressure: 450Pa
- Maximum Static Pressure: 1300Pa'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 9;
-- 2024/04/Slide3.jpg
UPDATE product_image SET caption_md = '### MULTI INSTALLATION DESIGN

- Open Concept
- Cabinet Concept
- Built in Concept'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 10;
-- 2024/04/Slide2.jpg
UPDATE product_image SET caption_md = '### 5.1-inch touch screen & Hand Sensor'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 11;
-- 2024/04/Slide7.jpg
UPDATE product_image SET caption_md = '### THE STRONGER AIR PRESSURE 1300PA IN THE MARKET

- 1300pa super static pressure
- Intelligent Volume Adjustable Suction
- rapid smoke exhaust and prevention of backflow'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 12;
-- 2024/04/Slide6.jpg
UPDATE product_image SET caption_md = '### CLOSED NEGATIVE PRESSURE BOTTOM

- 513mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 13;
-- 2024/04/Slide9.jpg
UPDATE product_image SET caption_md = '### Nano easy clean filter

### QUICK-RELEASE OIL FILTER

THE OIL FILTER HAS A QUICK-RELEASE STRUCTURE AND CAN BE EASILY DISASSEMBLED, CLEANED AND INSTALLED WITH JUST A GENTLE PULL.

### SEGMENTED OIL FILTER

THE TWO-SECTION OIL FILTER IS SMALLER IN SIZE THAN THE WHOLE-PIECE OIL SCREEN AND CAN BE PLACED IN THE DISHWASHER FOR CLEANING.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 14;
-- 2024/04/Slide12.jpg
UPDATE product_image SET caption_md = '### Multi-dimensional noise reduction technology

- 15dB
- 30dB
- 41dB
- 70dB'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919') AND position = 15;

-- vatti-aetheris-series-cooker-hood-v929 — 16 of 18 images carry text
-- 2025/07/V929-PG-9.webp
UPDATE product_image SET caption_md = '### Noise Level 46.5db
### Peaceful Kitchen Environment'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 2;
-- 2025/07/V929-PG-10.webp
UPDATE product_image SET caption_md = '### Smart AI Auto Link

When the cooker hob is ignited, the cooker hood automatically turns on to remove cooking smoke

* Only Available For Cooker Hob Model C836E'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 3;
-- 2025/07/V929-PG-12.webp
UPDATE product_image SET caption_md = '- 01 AG Tempered Glass
- 02 Non Filter Design
- 03 Built-in Oil Cup
- 04 Nano Coating'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 4;
-- 2025/07/V929-PG-13.webp
UPDATE product_image SET caption_md = '### Intelligence Hand Sensor

Right Wave

Open Intelligence Suction

Right Wave 2 Times

Open Stir-fry Suction

Left Wave

Delayed Shutdown

### Ambient Light'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 5;
-- 2025/07/V929-PG-8.webp
UPDATE product_image SET caption_md = '### IMPROVE KITCHEN AIR QUALITY

PM2.5(ug/m³)

068

PM2.5<75　75≤PM2.5<250　PM2.5>=250

Intelligent PM2.5 Measurement

Delayed Intelligent Suction Based On PM2.5 Concentration'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 6;
-- 2025/07/V929-PG-2.png
UPDATE product_image SET caption_md = '### Elegant and high-quality art design'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 7;
-- 2025/07/V929-PG-6.webp
UPDATE product_image SET caption_md = '### 79%

Enhanced smoke collection area'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 8;
-- 2025/07/V929-PG-15.webp
UPDATE product_image SET caption_md = '### Product Specification

- Product Model: V929
- Noise Level: 46.5dB（A）
- Suction Power: 3150m³/h
- Max Static Pressure (Pa): 1300Pa
- Auto Clean: Turbo Wash+Nano Coating
- Control: Hand Wave
- Odor Reduction Rate: 97%
- Oil Filtration Rate: 92%
- Product Dimension （W*H*D）: 896*1077*354mm
- Power Supply: 220-240V - 50Hz 208W'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 9;
-- 2025/07/V929-PG-1-1.webp
UPDATE product_image SET caption_md = '### clean smoke & purify the air'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 10;
-- 2025/07/V929-PG-2.webp
UPDATE product_image SET caption_md = '### Elegant and high-quality art design'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 11;
-- 2025/07/V929-PG-4.webp
UPDATE product_image SET caption_md = '### Kitchen Cabinet Design

### Independent Design'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 12;
-- 2025/07/V929-PG-5.webp
UPDATE product_image SET caption_md = '### Kitchen Cabinet Design

### Independent Design'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 13;
-- 2025/07/V929-PG-3.webp
UPDATE product_image SET caption_md = '### 0.618

Golden Ratio Division

### 1.2cm Ultra-slim'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 14;
-- 2025/07/V929-PG-1.png
UPDATE product_image SET caption_md = '### clean smoke & purify the air'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 15;
-- 2025/07/V929-PG-11.webp
UPDATE product_image SET caption_md = '### BOASTER CLEAN (冲浪洗)

THE FIFTH GENERATION AUTO CLEAN

CLEANING COVERAGE AREA MORE CLEAN

PATENTED NO: ZL201811044634.1 & Zl201811293915.0'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 16;
-- 2025/07/V929-PG-7.webp
UPDATE product_image SET caption_md = '### BLDC Motor
### High-efficiency Suction Power

3125m³/h Suction Power

1300Pa Air Pressure'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929') AND position = 17;

-- vatti-range-hood-v997 — 8 of 11 images carry text
-- 2025/10/00-C.png
UPDATE product_image SET caption_md = 'AG Grey and Light Lemon bring elegance with a pop.

AG GRAY

Where crisp white meets calming blue a kitchen that feels fresh and modern.

PEARL WHITE

Sleek black and crisp white a bold, modern kitchen combination.

BLACK'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND position = 3;
-- 2025/08/V997_Product-Picture-11.webp
UPDATE product_image SET caption_md = '### Which type of cooker hood should I choose? top-suction or side-suction

### Top Suction

The suction inlet is farther from the stove, so the smoke spreads more easily

### Side Suction

Low smoke capture efficiency, and fumes easily escape

### vatti V997

A combination top-suction and side-suction cooker hood

Top Suction

### Upgraded Three Chamber System

Side Suction

### Upgraded Ultra Slim Close'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND position = 4;
-- 2025/08/V997_Product-Picture-10.webp
UPDATE product_image SET caption_md = '### V997

- Upgraded Four Chamber System
- Airflow increased by 50%
- 4 cm closer to the smoke
- 36CM Ultra-slim design
- More space Does not obstruct space
- 2800m3/h 1200Pa
- Turbo Wash Auto-Clean

### Traditional Design

- Single Chamber Design
- Airflow Slow
- Distance Far, Smoke Easily Escapes
- Too deep, easy to bump your head
- Less Space blocks the view
- Low Suction Power
- Difficult To Maintain'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND position = 5;
-- 2025/08/V997_Product-Picture-7.webp
UPDATE product_image SET caption_md = '### Vatti V997 Cooker Hood

36CM Ultra Slim'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND position = 6;
-- 2025/08/V997_Product-Picture-9.webp
UPDATE product_image SET caption_md = '### Upgrade 3 Generation

1.0

2 Chamber

Capture smoke 70%

2.0

3 Chamber

Capture smoke 80%

3.0

4 Chamber

Capture smoke 99%'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND position = 7;
-- 2025/08/V997_Product-Picture-1-1.webp
UPDATE product_image SET caption_md = '### The Fifth Generation Auto Clean - Turbo Wash

4.0

Turbo Wash

During Cleaning a wave like acrtion expands the range, covering a wider areav for a more thorough clean

Effective 99.1%

3.0 Version 3 Effective 60.5%

2.0 Version 2 Effective 49%

1.0 Version 1 Effective 35%

Patented Design : ZL201811044634.1,'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND position = 8;
-- 2025/08/V997_Product-Picture-5.webp
UPDATE product_image SET caption_md = '### BLDC Motor

Durable, efficient, and quiet motor performance

1200Pa Air Pressure

2800m3/h Suction Power'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND position = 9;
-- 2025/08/V997_Product-Picture-3-1.webp
UPDATE product_image SET caption_md = '### Product Specification

- Product Model: V997
- Suction Power: 2800m3/h
- Max Static Pressure (Pa): 1200Pa
- Oil Separation: 92%
- Noise Level: 48dB（A）
- Energy efficiency Level: Level 1
- Auto Clean: Turbo Wash+Nano Coating
- Control: Hand Wave
- LED Light: 2x2W
- Power Supply: 220V-240V - 50Hz 208W'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND position = 10;

-- vatti-smart-oxygen-range-hood-v998 — 12 of 15 images carry text
-- (PG2, PG3, PG6 dropped as defects — see DEFECT_IMAGES in scripts/import-products.mjs)
-- 2026/04/V998-PG15.webp
UPDATE product_image SET caption_md = '### SPECIFICATIONS

- 400
- 长 898
- 320
- 541
- 544
- 底 357
- 宽126
- 单位：mm

- Model No.: V998
- External Size (mm) LxWxH: 898×357×126 (Excluding decorative panel)
- Maximum Static Pressure: 1250Pa
- Voltage: 220V~/50Hz
- Noise Level (A Weighted): 49dB(A)
- Grease Separation: 92%
- Exhaust Volume: 2850m³/h
- Energy Efficiency Rank: 1
- Max Motor Power: 200W
- Exhaust Outlet Size: Ø185 mm
- Rated Power: 4W
- Odor Purification Rate: 97%'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 3;
-- 2026/04/V998-PG13.webp
UPDATE product_image SET caption_md = '### AG BABY SKIN TOUCH GLASS

Fingerprint & Smudge Resistant

### Explosion-Proof Protection Layer

Effectively prevents glass shattering for safe use

### High-Temp Oil Layer

Temperature-enduring oil layer, fearlessly dissolves stubborn oil

### Acid-Resistant Protection Layer

Acid-resistant layer preventing corrosion from cooking fumes

### Enhanced AG Matte Glass

Resistant to cuts, scratches, and deformations, with timeless quality

### Nanometer Oil-Repellent Glass Surface

Super smooth oil-repellent surface leaving no fingerprints & smears'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 4;
-- 2026/04/V998-PG10.webp
UPDATE product_image SET caption_md = '### AI SMOKE-FREE COOKING

### STOVE RANGE HOOD LINKAGE SMART SMOKE EXTRACTION

Stove ignites, range hood simultaneously starts smoke extraction, to help you focus on cooking without the rush.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 5;
-- 2026/04/V998-PG9.webp
UPDATE product_image SET caption_md = '### NO OIL SMOKE ESCAPE

### WIDE SMOKE CONTROL SCREEN FOCUSES SMOKE SOURCE STRONG LOCKING OF SMOKE

Adopts frequency conversion motor and releases ultra-strong suction performance. Innovatively designed wide smoke control screen with negative pressure lock, dual coverage, strong sealed locking of the smoke rising area, prevents oil smoke from spreading

### 31° Golden Opening Angle

Negative close distance suction, better smoke control

### 31° 拢烟

### WIDE SCREEN LOWER NEGATIVE PRESSURE

No oil smoke escape

### 90° Smoke

### NARROW SCREEN HIGHER NEGATIVE PRESSURE

Smoke escapes from the sides'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 6;
-- 2026/04/V998-PG7.webp
UPDATE product_image SET caption_md = '### Compatible with All Cabinet Styles

Flat Installation'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 7;
-- 2026/04/V998-PG5.webp
UPDATE product_image SET caption_md = '### Ultraslim Design

### 12.6cm Ultra-Slim

Fully embedded into the wall cabinet, flush with the cabinet. No exposed wires, head bumps, or blocked pots, freeing up more kitchen space.

12.6cm

### Vatti O2 Cleaner

- No Head Bumps
- Spacious Space
- Easy to Clean

### Traditional Top-Side Suction

<380mm

- Protrudes Over >380mm
- Hits Head Easily
- Blocks Large Pots'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 8;
-- 2026/04/V998-PG1.webp
UPDATE product_image SET caption_md = '### New Ultra Slim Topside Dual Suction Clean Your Smoke, Purify Your Air

VATTI Smart Oxygen Range Hood V998'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 9;
-- 2026/04/V998-PG14.webp
UPDATE product_image SET caption_md = '### PRECISE ENGINEERING, REFINED DETAILS ENHANCED COOKING EXPERIENCE

### NEW UI DESIGN

Clear Appliance Status at a Glance

### LED SOFT LIGHTING

Brightly Illuminates Cooking Area

### 49dB LOW NOISE OPERATION

Quiet Cooking Environment

### NATIONWIDE FIRST-CLASS ENERGY EFFICIENCY

More Energy Saving, Worry-Free Cooking'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 10;
-- 2026/04/V998-PG12.webp
UPDATE product_image SET caption_md = '### UPGRADED CLEANING

Easier Post-Cooking Cleaning

### OIL-REPELLENT ENAMELED GUIDE PLATE

Wipe once, no oil residue

### REMOVAL-FREE MESHLESS DESIGN

Reduces cleaning difficulty

### EXTRA LARGE OIL CUP

Reduces oil discharging frequency'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 11;
-- 2026/04/V998-PG11.webp
UPDATE product_image SET caption_md = '### FIFTH GENERATION STEAM WATER WASH

### STEAM + HOT WATER DOUBLE CLEAN 1+1>2

Equipped with heating pump to wash with high-temp steam dissolving stubborn grease, paddle brush scrubbing deeply cleans fan blades & cavity, cleans more thoroughly and provides longer-lasting power

### THE CLEANING POWER COMPARED

### STEAM WATER WASH

Cleans more thoroughly
Covers cleanliness rate up to 99.1%

### REGULAR WATER WASH

Only cleans partially
Covers cleanliness rate less th 50%'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 12;
-- 2026/04/V998-PG8.webp
UPDATE product_image SET caption_md = '### 2+2 4-way Direct Exhaust

### Top-Side Dual Suction Low-Side High Extraction

### 2850m³/h

Strong Suction
Captures Smoke at the Source

### 1250Pa'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 13;
-- 2026/04/V998-PG4.webp
UPDATE product_image SET caption_md = '### Dual Particle Capture Technology

Uses VATTI VNIA aigorithm to intelligently detect and precisely capture cooking fumes and PM2.5, removing both smoke and airborne pollutants.

*Testing scenario: Initial use requires turning on the steamcleaning function through the range hood''s app in the background settings; subsequent uses automatically enable and run the PM2.5 cap-'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998') AND position = 14;

-- vatti-hidden-series-range-hood-v938 — 16 of 19 images carry text
-- (V998-PG8 dropped: it is a V998 slide, and its figures contradict V938's own)
-- 2026/05/V938-PG2.webp
UPDATE product_image SET caption_md = 'All-New Release

### Hidden Series V938

Redefining Premium Kitchen Order

Say goodbye to visual clutter. Seamlessly concealed within cabinetry, opening up space while balancing performance and design. Cleaner. Calmer. More refined.

Hidden in Form · Open in Space · Refined in Living'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 3;
-- 2026/05/V938-PG3.webp
UPDATE product_image SET caption_md = '### Half Hidden. Fully Refined.

Designed to give space back to living. Not filled—freed.

Seamlessly integrated into cabinetry, reducing visual weight above.

More space. More freedom.

- 325mm Slim Depth
- 105mm Opening Clearance
- 3 cm Built-In Clearance

### Built-In Design. Concealed When Closed.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 4;
-- 2026/05/V938-PG4.webp
UPDATE product_image SET caption_md = '### Control, Without Touch. Cook Freely.

Smart Gesture Control

Gesture sensing for effortless control. No fingerprints. No distractions.

Switch modes with a simple wave—no need to search for buttons.

Gesture Sensing
Intuitive & Responsive

No Fingerprints
Clean & Easy

Quick Mode Switch
No Buttons Needed'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 5;
-- 2026/05/V938-PG5.webp
UPDATE product_image SET caption_md = '### AI Adjusts. You Just Cook.

Smart Sensing Auto Adjust

Smart sensing detects airflow resistance and adjusts extraction automatically.

No smoke overflow. No manual adjustments.

Just effortless cooking—every time.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 6;
-- 2026/05/V938-PG6.webp
UPDATE product_image SET caption_md = '### Quiet Moments. Designed for Living.

Engineered with precision components and advanced noise reduction materials.

Noise fades into the background—so you can stay present.

Hear the gentle sizzle. Feel the calm of every moment in the kitchen.

47dB*'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 7;
-- 2026/05/V938-PG7.webp
UPDATE product_image SET caption_md = 'Smart Sync. Effortless Control.

### Auto Start. Auto Stop.

Ignition triggers extraction—instantly. Cooking ends, airflow continues.

Clears residual smoke, then powers down automatically.

- HOB SYNC
- AUTO EXTRACTION
- 3-MIN DELAY SHUTDOWN'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 8;
-- 2026/05/V938-PG14.webp
UPDATE product_image SET caption_md = '### Smart Control. One Tap Away.

Connected to your smart home ecosystem. Control everything from your phone—simple, seamless, instant.

More Functions, Unlocked

- Adjust Airflow
- Activate Self-Clean
- Auto Clean Reminder
- One-Tap Service

Step 1
Set "Smart Mode"

Step 2
Turn On Hood

Step 3
Auto Refresh Air'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 9;
-- 2026/05/V938-PG15.webp
UPDATE product_image SET caption_md = '### Seamlessly Fits Any Kitchen

Designed for Every Style

Whether it''s a new renovation or a kitchen upgrade, it blends effortlessly into any space.

Quietly Powerful. Perfectly Integrated.

### Classic Elegant Style

Timeless warmth. Refined living.

### Light Luxury Italian Style

Sleek textures. Elevated sophistication.

### Modern Minimal Style

Pure lines. Quiet perfection.

Seamless Integration
Matches any kitchen design

Premium Craftsmanship
Built for lasting beauty

Powerful Performance
Precision in every detail

Quiet by Design
Discreet. Peaceful. Refined.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 10;
-- 2026/05/V938-PG17.webp
UPDATE product_image SET caption_md = '### V938

Seamless. Powerful. Invisible.

PERFORMANCE

- Power Airflow: 3650 m³/h
- Static Pressure: 1600 Pa
- Odor Reduction: 97 %
- Grease Separation: 92 %

QUIET EFFICIENCY

- Operating Noise: 47 dB(A)
- Energy Rating: Grade 1

ENGINEERED POWER

- BLDC Inverter Motor: 490 W Rated Power
- Frequency: 50-60 Hz
- Voltage: 220-240 V~

LIGHTING

- LED Illumination: 2 × 2 W'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 11;
-- 2026/05/V938-PG8.webp
UPDATE product_image SET caption_md = 'Quiet Power. Perfect Control.

### Clean Cooking. No Smoke.

High airflow meets high static pressure. Even in open kitchens, air stays clear and fresh.

- 3650 m³/h Airflow Power
- 1600 Pa Static Pressure

### BLDC Inverter Motor

Engineered for Silent Power.

Precision-built for durability. Stable. Efficient. Long-lasting.

- 3.2 kg Core Weight — Soiid internal build
- 2000 rpm — High-speed rotation
- 30,000+ Hours — Tested for endurance

High Airflow • Strong Pressure • Brushless Inverter Motor'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 12;
-- 2026/05/V938-PG9.webp
UPDATE product_image SET caption_md = 'Quiet Air. Healthier Living.

### Kitchen Air Manager 24-Hour Purification

Automatically detects air quality. Adjusts ventilation in real time.

Even on standby, it refreshes your space—continuously.

Always clean. Always ready.

- Formaldehyde
- Ammonia
- Nitrogen Oxides
- Benzene
- Carbon Monoxide
- Alcohol
- Odors

AI Sensing

Auto Ventilation

24H Standby Purification'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 13;
-- 2026/05/V938-PG10.webp
UPDATE product_image SET caption_md = '### Floating AI Display Clarity, At a Glance.

Seamless crystal interface. Clean visuals. Effortless control.

Air quality and operation status, instantly understood.

SMART MODE

Adjusts airflow automatically.

AIR QUALITY INDICATOR

POOR AIR
High-speed extraction

MODERATE AIR
Balanced operation

GOOD AIR
Low-speed energy saving

CLEAN AIR
Standby mode

AI SENSING · DYNAMIC AIRFLOW ADJUSTMENT · AMBIENT LIGHT INDICATORS'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 14;
-- 2026/05/V938-PG11.webp
UPDATE product_image SET caption_md = '### Vertical Capture System. Smoke, Instantly Controlled.

Captures fumes at the source. Locks in grease and smoke instantly.

From high-heat stir-fry to relaxed dining—seamlessly.

No lingering fumes. Just clean air.

- Vertical Airflow Design
- Instant Capture Performance
- Seamless Cooking Transition

POWERFUL CAPTURE · CLEAN AIR · ELEVATED LIVING'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 15;
-- 2026/05/V938-PG12.webp
UPDATE product_image SET caption_md = '1:5:1

### Capture Ratio 1:5:1

No Escape for Smoke.

Triple-zone intake design. Locks fumes at the source.

No side leakage. No escape.

### Precision Exhaust System

Smooth. Fast. Complete.

Dual-track to quad-flow acceleration. Separates and expels smoke instantly.

High-speed airflow. Powerful and efficient.

Seamless extraction. Clean air, instantly restored.

ENGINEERED INTAKE · ACCELERATED EXHAUST · COMPLETE PERFORMANCE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 16;
-- 2026/05/V938-PG13.webp
UPDATE product_image SET caption_md = '### Effortless Care. Power That Lasts.

### Steam + Hot Water Dual Clean. Beyond Clean.

Advanced 5th-generation cleaning system. Cleans not only the fan, but the inner chamber.

Steam dissolves grease. Hot water flushes it away.

Deep, complete cleaning—maintaining powerful suction over time.

- Full Coverage Cleaning Rate: 99.1%
- Deep Clean Rate: 99.2%
- Sterilization Rate: 99.99%'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 17;
-- 2026/05/V938-PG16.webp
UPDATE product_image SET caption_md = '### Flexible by Design Fits Every Kitchen

Seamless. Built-in. Standalone.

### Perfectly Flush

No protrusion. Clean lines.

- Front panel aligns with cabinet base
- No cabinet cut-out required

### Hidden. Expanded.

Maximize space. Minimize presence.

- Front section concealed inside cabinetry

### Slim Independence

Minimal form. Maximum impact.

DESIGNED TO DISAPPEAR. BUILT TO PERFORM.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938') AND position = 18;

-- vatti-stellar-series-cooker-hood-v960 — 13 of 16 images carry text
-- 2026/05/V960-PG1.webp
UPDATE product_image SET caption_md = 'Smart & Stylish Kitchen Technology

### Ultra-Slim Power Dual-Purification Airflow

VATTI Stellar Series Cooker Hood V960

华帝全新品牌代言人 张凌赫

- Ultra-Slim Design — Seamless Flush Installation
- 3690m³/h — Powerful Suction
- 1700Pa — High Static Pressure
- Dual-Chamber Air Capture — Precision Direct Extraction
- PM2.5 — Air Purification Control
- Easy Clean Inside & Out — One-Touch Auto Cleaning'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 3;
-- 2026/05/V960-PG2.webp
UPDATE product_image SET caption_md = '### 225mm Slim. Seamless by Design.

Redefining Kitchen Order.

- Ultra-slim 225mm — Space-saving design
- Opens Without Protrusion — Clean visual line
- Function Meets Elegance — Cook in comfort, live in style

- 225mm
- 190mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 4;
-- 2026/05/V960-PG3.webp
UPDATE product_image SET caption_md = '### Smart Motion Display Lights Up As You Approach

As you step into the kitchen, the display awakens like soft night light—gentle, refined, and responsive.
As you leave, it fades quietly into calm—undisturbed, preserving every moment of cooking.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 5;
-- 2026/05/V960-PG4.webp
UPDATE product_image SET caption_md = '### Dual-Chamber for Dual Burners Precision Extraction • Smoke-Free Cooking

Dual chambers with dual exhaust—each burner gets dedicated, precise smoke capture.
No escape for fumes. Your kitchen stays fresh from start to finish.

### Certified Level-1 Smoke Extraction

Proven Core Performance in Clean Air Power'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 6;
-- 2026/05/V960-PG5.webp
UPDATE product_image SET caption_md = '### 1700Pa High Static Pressure

High-pressure airflow breaks through duct resistance, expelling heavy cooking fumes instantly—even during peak usage.

- Strong Pressure — Powerful Smoke Extraction
- Anti-Backflow — No Return of Fumes Even on Lower Floors
- Breaks Duct Resistance — Smooth Exhaust All the Way
- Peak Cooking Ready — Clear Air Every Time'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 7;
-- 2026/05/V960-PG6.webp
UPDATE product_image SET caption_md = '### POWERFUL AIRFLOW PERFORMANCE

### 3690 m³/h RAPID EXTRACTION

- Strong Suction — Powerful, worry-free cooking
- 25.9s Smoke Clearing* — Quickly removes heavy fumes
- Open Kitchen Friendly — Keeps your home fresh and clean

Clears heavy cooking fumes in just 25.9 seconds.
Effortlessly handles stir-fry, high-heat cooking, and open kitchens—keeping your space fresh and smoke-free.

### 4-LEVEL AIRFLOW CONTROL

- LEVEL 1 — Gentle simmering & soups
- LEVEL 2 — Steaming, boiling & light frying
- LEVEL 3 — Fast stir-fry & braising
- LEVEL 4 — High-heat wok cooking

*Based on a standard 6m² kitchen with 2.3m ceiling height. Actual performance may vary depending on kitchen size and conditions.
3690 m³/h refers to maximum airflow during high-heat cooking, tested under standard laboratory conditions.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 8;
-- 2026/05/V960-PG8.webp
UPDATE product_image SET caption_md = '### Silence, Engineered. Power You Can Barely Hear.

Maintains powerful suction with ultra-quiet operation.

As low as 48dB—enjoy cooking, videos, and conversations without disturbance.

- Ultra-Quiet Performance — As Low as 48dB
- Powerful Suction — Worry-free cooking
- Open Kitchen Friendly — Keeps your home fresh and clean

AS LOW AS 48dB

- INVERTER DC MOTOR — Active noise reduction operation
- TOP-MOUNTED AIR CHAMBER — Moves noise further away from ear level
- V-SHAPE PATENTED VOLUTE — Reduces airflow turbulence noise
- MICRO-PERFORATED SOUND ABSORPTION — Effectively absorbs fan noise'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 9;
-- 2026/05/V960-PG9.webp
UPDATE product_image SET caption_md = '### Microwave Radar

### Gesture Control, Precisely Defined More Gestures • Greater Accuracy

Microwave radar sensing precisely tracks human motion, recognizing multiple gestures with high accuracy.
Zero-touch control for power on/off and fan speed adjustment.

### Supports Multiple Gestures

- Forward Palm Wave — Power On / Off
- Upward Palm Lift — Increase Fan Speed
- Backhand Upward Motion — Decrease Fan Speed
- Side Arm Swipe — Pause / Resume'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 10;
-- 2026/05/V960-PG10.webp
UPDATE product_image SET caption_md = '### Just a Wave. Control Everything.

Smarter cooking. Seamlessly controlled.

### Auto Sync

Ignites. Extracts.

Hob and hood connect automatically. Power on the hob, extraction starts.

### WiFi Control

Anywhere.

Connect via the Vatti Smart App. Control anytime, anywhere.

### 3-Min Delay

Finishes Clean.

Continues extraction for 3 minutes after cooking. Clears the air completely.

- Auto-connect Intelligent Linkage
- Smart App Remote Control
- Delay Shutdown Extra Clean Air'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 11;
-- 2026/05/V960-PG11.webp
UPDATE product_image SET caption_md = '### Smooth. Clean. Refined.

- Low Reflection — Easy on the eyes
- Anti-Fingerprint — Stays pristine
- Scratch Resistant — Built to last
- Wipe Clean — Effortless care

### AG Glass Panel

- Delicate, smooth touch
- No fingerprints
- Upgraded anti-explosion
- Low reflection
- Gentle on the eyes

### Conventional Glass Panel

- Rough, sticky touch
- Leaves fingerprints easily
- Poor anti-explosion
- High reflection, unsafe
- Harsh on the eyes

AG (Anti-Glare) Glass Finish | Anti-Fingerprint | Durable & Easy to Clean'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 12;
-- 2026/05/V960-PG12.webp
UPDATE product_image SET caption_md = '### EASY OUTSIDE CLEANING

### Self-Cleaning. Like New, Every Time.

Vatti Pulse-Wave Wash Tech.
Powerful suction. Lasting freshness.

- One-Tap Wash — Deep clean, instantly.
- High-Pressure Rinse — Breaks down grease.
- Turbo Dry — Clean. Dry. Ready.

*Auto wash cycle runs for 60 minutes with the hood closed. "Self-Cleaning" indicator flashes during the cycle and will notify you when complete. Cleaning effectiveness ≥99%.
Sterilization rate ≥99.9%. (Test Report No.: WTS2025-20453)'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 13;
-- 2026/05/V960-PG13.webp
UPDATE product_image SET caption_md = '### Specifications

Unit: mm

- 400
- 542
- 160
- 896

- Model: V960
- Noise Level: 48 dB(A)
- Airflow: 3690 m³/h
- Air Pressure: 1700 Pa
- Auto Clean Turbo Wash: Yes
- Control: Gesture · Auto Sync · WiFi
- Oil Separation: 92%
- Grease Filtration Efficiency: 97%
- Dimensions (W × H × D): 896 × 702 × 350 mm (extended)
- Duct Cover Size (W × H × D): 393.4 × 200 × 306.3 mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 14;
-- 2026/05/V960-PG7.webp
UPDATE product_image SET caption_md = '### PM2.5 Smart Air Management Pure Air in Every Inch of Your Kitchen

Built-in high-precision PM2.5 sensor monitors air quality in real time, automatically adjusting to optimal suction performance.

After cooking, intelligent delay extraction continues—keeping even open kitchens fresh and free from lingering fumes.

- PM2.5 Real-Time Monitoring — High-Precision Sensor Detects Air Quality
- Automatic Suction Adjustment — Smartly Adapts to Air Quality for Optimal Performance
- Intelligent Delay Extraction — Continues Purifying After Cooking Ends
- Fresh Air, All Around — Open Kitchen Friendly No Lingering Fumes'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960') AND position = 15;

-- vatti-cooker-hood-v917-carbon-grey — 6 of 9 images carry text
-- 2026/05/V917-Carbon-Grey-Cooker-Hood-description-1.webp
UPDATE product_image SET caption_md = '### New 3D Design Cooker Hood

V917

The top suction inlet collects smoke standily and captures rising oil smoke.

The lower suction inlet collect faster.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey') AND position = 3;
-- 2026/05/V917-Carbon-Grey-Cooker-Hood-description-2.webp
UPDATE product_image SET caption_md = '### 2250m³/h
### Turbo Suction Capacity

hurricane suction: farewell to the continuous smoke in the kitchen, and freely handle various stir-fry dishes

2250m³/h'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey') AND position = 4;
-- 2026/05/V917-Carbon-Grey-Cooker-Hood-description-3.webp
UPDATE product_image SET caption_md = '### 900Pa
### Big Static Pressure

No fear of smoke exhaust resistance from complex ducting; no backflow, no smoke blockage, and freely handle the cooking rush hours.

900Pa'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey') AND position = 5;
-- 2026/05/V917-Carbon-Grey-Cooker-Hood-description-4.webp
UPDATE product_image SET caption_md = '### Smart Hand Gesture Control:

control with a wave of hands from a distance, greasy fingertips print on panel

From left to right, turn on the machine and adjust the air volume

From right to left, turn off the machine'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey') AND position = 6;
-- 2026/05/V917-Carbon-Grey-Cooker-Hood-description-5.webp
UPDATE product_image SET caption_md = '### Heat Auto-clean

Step upgrade 17 minutes of long-lasting cleaning

Step upgrade 2-step high-frequency dissolution

### 17 minutes cleaning process

17min

- 01 The first high temperature heating — 3min
- 02 Continuous heating to peel off oil stains — 2min
- 03 The high speed fan running to throws off oil — 30 second
- 04 The second high temperature heating deeply dissolved stains — 5min
- 05 The high speed fan running for deep oil removal — 30 second
- 06 The third high temperature heating dissolves stubborn oil stains — 5min
- 07 The high speed fan rotates for drying inner surface — 1min'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey') AND position = 7;
-- 2026/05/V917-Carbon-Grey-Cooker-Hood-description-6.png
UPDATE product_image SET caption_md = '### Removable smoke guide plate

### Hinged front panel design.

Easy to open with one hand,

simple and quick cleaning,

comprehensively improve the use experience.

Hinged front panel

Secure and stable

One hand easy open

Easy to clean

Simple and quick cleaning

More convenient'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey') AND position = 8;

-- vatti-cooker-hood-v917-white — 10 of 13 images carry text
-- 2026/05/V997-Batik-Cabinet-Description-1.webp
UPDATE product_image SET caption_md = '### SIRI BATIK KEUNGGULAN

### 01 ANGGUN & MINIMAL

Rekaan moden yang bersih menyerlahkan keindahan setiap ruang dapur.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 3;
-- 2026/05/V997-Batik-Cabinet-Description-2.webp
UPDATE product_image SET caption_md = '### SIRI BATIK KEUNGGULAN

### 02 TENANG & BERGAYA

Sentuhan batik biru pada latar kelabu memberikan suasana tenang dan eksklusif.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 4;
-- 2026/05/V997-Batik-Cabinet-Description-3.webp
UPDATE product_image SET caption_md = '### SIRI BATIK KEUNGGULAN

### 03 KLASIK & HANGAT

Padanan kayu dan batik mencipta suasana dapur yang klasik dan mesra.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 5;
-- 2026/05/V997-Batik-Cabinet-Description-4.webp
UPDATE product_image SET caption_md = '### SIRI BATIK KEUNGGULAN

### 04 BERSIH & SEGAR

Rekaan putih murni dan batik membawa rasa lapang dan menenangkan setiap masakan.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 6;
-- 2026/05/V997-Batik-Cabinet-Description-5.webp
UPDATE product_image SET caption_md = '### SIRI BATIK KEUNGGULAN

### 05 MEWAH & MODEN

Warna hangat dan aksen batik memberi sentuhan mewah dan kontemporari.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 7;
-- 2026/05/V997-Batik-Cabinet-Description-B-1.webp
UPDATE product_image SET caption_md = '### 2250m³/h Kapasiti Sedutan Turbo

Sedutan taufan:  ucapkan selamat tinggal kepada asap berterusan di dapur, dan kendalikan pelbagai hidangan tumis dengan mudah mengikut cara masakan Malaysia.

### SEDUTAN TAUFAN

Aliran udara yang kuat menyingkirkan asap dengan segera.

### PRESTASI KUAT & SENYAP

Motor berkecekapan tinggi untuk sedutan yang stabil dan senyap.

### MUDAH DIBERSIHKAN & DISENGGARA

Permukaan licin dan panel minyak boleh tanggal untuk pembersihan lebih mudah.

### LAMPU LED JIMAT TENAGA

Cahaya terang dan lembut untuk pengalaman memasak yang selesa.

Diilhamkan oleh Batik Malaysia Warisan'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 8;
-- 2026/05/V997-Batik-Cabinet-Description-B-2.webp
UPDATE product_image SET caption_md = '### Kawalan Isyarat Tangan Pintar:

kawal dengan gerakan tangan dari jarak, cetak cap jari berminyak pada panel

V917

### SEDUTAN TAUFAN

Aliran udara kuat menyingkirkan asap dengan segera

### PRESTASI KUAT & SENYAP

Motor berkecabatan tinggi untuk sedutan yang stabil dan senyap

### MUDAH DIBERSIHKAN & DISENGGARA

Permukaan licin dan panel minyak boleh tanggal untuk pembersihan lebih mudah

### LAMPU LED JIMAT TENAGA

Cahaya terang dan lembut untuk pengalaman memasak yang selesa

### Dari kiri ke kanan

Lambaikan tangan dari kiri ke kanan untuk menghidupkan mesin dan melaraskan kelajuan sedutan

### Dari kanan ke kiri

Lambaikan tangan dari kanan ke kiri untuk mematikan mesin'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 9;
-- 2026/05/V997-Batik-Cabinet-Description-B-3.webp
UPDATE product_image SET caption_md = '### Papan panduan asap yang boleh tanggal

### Reka bentuk panel hadapan berengsel.

Mudah dibuka dengan satu tangan, mudah dan cepat dibersihkan, serta meningkatkan pegalaman penggunaan dengan lebih menyeluruh.

### PERHATIAN

Papan panduan asap boleh dibuka.

### PANEL HADAPAN BERENGSEL

Selamat dan stabil

### MUDAH DIBUKA DENGAN SATU TANGAN

Mudah dibersihkan

### BERSIH DENGAN MUDAH & CEPAT

Lebih mudah dan praktikal

### Mudah Dibuka

Buka panel hadapan ke bawah untuk membersihkan.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 10;
-- 2026/05/V997-Batik-Cabinet-Description-B-4.webp
UPDATE product_image SET caption_md = '### Rekaan 3D Baharu Hud Dapur

V917

Rekaan moden, fungsi pintar, untuk dapur Malaysia.

### PANEL HADAPAN BERENGSEL

Mudah dibuka dengan satu tangan, kukuh dan selamat.

### BUKA DENGAN SATU TANGAN

Rekaan pintar untuk kemudahan harian anda.

### PEMBERSIHAN CEPAT & MUDAH

Permukaan licin dan komponen boleh tanggal untuk pembersihan lebih mudah.

### LAMPU LED JIMAT TENAGA

Cahaya terang dan lembut untuk pengalaman memasak yang selesa.

Diilhamkan oleh

### BATIK MALAYSIA

Warisan budaya, keanggunan dalam setiap perincian.

Saluran sedutan atas mengumpul asap dan menangkap wap minyak yang naik.

Saluran sedutan bawah menyedut dengan lebih pantas dan berkesan.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 11;
-- 2026/05/V997-Batik-Cabinet-Description-B-5.webp
UPDATE product_image SET caption_md = '### Pembersihan Auto-Haba

Tingkatkan langkah — Pembersihan berpanjangan selama 17 minit

Tingkatkan langkah — Pelarutan frekuensi tinggi 2 langkah

### Proses pembersihan selama 17 minit

17 minit

- 01 Haba suhu tinggi pertama untuk memanaskan
- 02 Haba berterusan untuk melonggarkan kesan minyak
- 03 Kipas berkelajuan tinggi beroperasi untuk membaling dan menyingkirkan minyak
- 04 Haba suhu tinggi kedua melarutkan kotoran terlarut sepenuhnya
- 05 Kipas berkelajuan tinggi beroperasi untuk penyingkiran minyak yang mendalam
- 06 Haba suhu tinggi ketiga melarutkan kotoran minyak degil
- 07 Kipas berkelajuan tinggi berputar untuk mengeringkan permukaan dalam'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white') AND position = 12;

-- professional-series-c720s — 7 of 10 images carry text
-- 2023/11/VATTI-C720S-Cooker-Hob_10.webp
UPDATE product_image SET caption_md = '### POWERFUL BURNER GAS HOB

### X-MAX

INNOVATIVE AESTHETIC DESIGN, COMBINATION OF MAJESTIC EXPRESSION & EFFICIENT COOKING EXPERIENCE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c720s') AND position = 2;
-- 2023/11/VATTI-C720S-Cooker-Hob_3.webp
UPDATE product_image SET caption_md = '### EASY CLEAN DESIGN

INTEGRATED TOP SHEET EASY TO CLEAN OFF WITHOUT RESIDUE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c720s') AND position = 3;
-- 2023/11/VATTI-C720S-Cooker-Hob_7.webp
UPDATE product_image SET caption_md = '### X-MAX SQUARE PAN SUPPORT DESIGN

Durable & Stable Pan Support for Avoiding Pan Falling off. Square Frame Structure Design for Conwerging Energy, Increasing Heat Efficiency & Improving Fire Insulation'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c720s') AND position = 4;
-- 2023/11/VATTI-C720S-Cooker-Hob_4.webp
UPDATE product_image SET caption_md = '### CHILD-LOCK VALVE & KNOB

INTERNAL CHILD-LOCK & MICRO-SWITCHES TO AVOID ACCIDENTAL IGNITION UNDER CONDITION OF DAILY MAINTENANCE OR CHILD CONTACT.

### EASY CLEAN DESIGN

INTEGRATED TOP SHEET EASY TO CLEAN OFF WITHOUT RESIDUE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c720s') AND position = 5;
-- 2023/11/VATTI-C720S-Cooker-Hob_5.webp
UPDATE product_image SET caption_md = '### PATENT "THOR" POWERFUL BURNER

STEPLESS WOK BURNER CONTROLSTABLE MULTIPLE SEGMENTS FLAMES FOR MULTIPLE COOK STYLES.

HIGH PERFORMANCE WOK BURNER

### COMPREHENSIVE SELF-INITIATIVE SAFETY SYSTEM'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c720s') AND position = 7;
-- 2023/11/VATTI-C720S-Cooker-Hob_6.webp
UPDATE product_image SET caption_md = '### ORIGINAL SPANISH FLAME FAILURE DEVICE

SENSITIVE FLAME FAILURE DEVICE TO GUARANTEE USAGE SAFETY-IF THE GAS FLAME IS TEMPORARILY EXTINGUISHED, E.G. BECAUSE A PAN BOILS OVER OR DUE TO A DRAUGHT, A FLAME FAILURE DEVICE WILL STOP THE SUPPLY OF GAS.

### PATENT "THOR" POWERFUL BURNER'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c720s') AND position = 8;
-- 2023/11/VATTI-C720S-Cooker-Hob_11-1.webp
UPDATE product_image SET caption_md = '### SPECIFICATION

- Width: 780mm
- Depth: 450mm
- Cut-out width: 708mm
- Cut-out depth: 388mm
- Cut-out corner radius: R20mm

C720S

- Power(KW): 5.2KW, 1.75KW, 5.2KW
- Energy level(≥52%): Level 2 (≥52%)
- Dimension(mm): 780x450
- Cut-out Size(mm): 708x388xR5
- Gas Type: NG/LPG
- Pressure(PA)T/Y: NG:1000/2000Pa; LPG:2750Pa
- Finish: 0.8mm Stainless Steel
- Ignition: Auto Ignition
- Flame Failure Device: Thermocouple
- Net/Gross weight: 16.8kgs/19.8kgs
- Burners: 2/3'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c720s') AND position = 9;

-- professional-series-c821g — 4 of 5 images carry text
-- 2023/11/Cooker-hob-C821G_1.webp
UPDATE product_image SET caption_md = 'C821G

- SOLID SQUARE RACK
- POWERFUL FLAME — 4.5kW
- GRADE 1 ENERGY EFFICIENCY

### ROTATIONAL POLYTHERMAL FORCE

INNER FLAME RING DOUBLE LAYER FLAME

EXTERNAL FLAME RING FIRE CYCLE AROUND THE FLAME'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c821g') AND position = 1;
-- 2023/11/Cooker-hob-C821G_5.webp
UPDATE product_image SET caption_md = '### PRODUCT DIMENSION

- MODEL: C821G
- FIRE FLAME: 4.5KW (LEFT & RIGHT)
- ENERGY EFFICIENCY: 65%
- SAFETY SYSTEM: SAFETY DEVICE
- IGNITION: BATTERY
- GAS TYPES: LPG / NATURAL
- PRODUCT DIMENSION (mm): 750(W) X 420(D) X 149(H)
- OPEN HOLE DIMENSION (mm): 650(W) X 320(D) X 20(H)
- OPEN HOLE DIMENSION: 650mm x 380mm
- MINIMUM HEIGHT: 110mm
- R20'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c821g') AND position = 2;
-- 2023/11/Cooker-hob-C821G_3.webp
UPDATE product_image SET caption_md = '### 3D OXYGEN INPUT DESIGN

### UPPER LEVEL

12 AIR INTAKE SLOTS SPIRAL THE TOP AIR

### MEDIUM LEVEL

THE SKELETONIZER GUIDES THE CENTRAL AIR

### LOWER LEVEL

WIDE DIAMETER PILOT TUBE SIPHONS THE BOTTOM AIR'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c821g') AND position = 3;
-- 2023/11/Cooker-hob-C821G_6.webp
UPDATE product_image SET caption_md = '### FLEXIBLE INSTALLATION

TABLE TOP

BUILT IN

### SAFETY DEVICE PROTECTION TECHNOLOGY

IN CASR OF ACCIDENTAL SHUTDOWN, SAFETY DEVICE INSTANT SENSE.
QUICKLY CLOSE THE GAS VALVE AND CUT OFF THE GAS SUPPLY.

### AUTO SPARK IGNITION

PRESS & TURN A KNOB TO IGNITE THE GAS BURNER. MORE SAFER & MORE APPEALING COMPARE OLDER MANUAL GAS BURNER USE A MATCHSTICK OR LIGHTER TO START A FIRE.

### CHILD LOCK

BUILT-IN CHILD LOCK & MICRO SWITCH.
THE KNOB MUST BE PRESSED DOWN & ROTATED COUNTERCLOCKWISE TO IGNITE THE IGNITION.
TO AVOID ACCIDENTAL IGNITION BY CHILDREN.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'professional-series-c821g') AND position = 4;

-- vatti-ai-hob-c835g — 9 of 11 images carry text
-- 2023/11/VATTI-AI-Hob-C835G.webp
UPDATE product_image SET caption_md = '### FIREPOWER AUTOMATIC MATCHING MAKE COOKING EASIER

C835G

SPINNING AND EVEN FIRE TECHNOLOGY

INTELLIGENT TEMPERATURE DETECTION

AUTOMATICALLY ADJUSTS FOR OPTIMAL FIREPOWER'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 2;
-- 2023/11/VATTI-AI-Hob-C835G_5.webp
UPDATE product_image SET caption_md = 'IN THE INTELLIGENT MODE, COOKING MODE SUCH AS SOUP AND PORRIDGE, THE FIREPOWER IS AUTOMATICALLY ADJUSTED TO MAINTAIN THE SOUP TEMPERATURE IN THE POT AT 100℃ TO ACHIEVE THE EFFECT OF NOT OVERFLOWING THE POT.

### SMART TEMPERATURE SENSOR

### ANTI-DRY HOT POT

### MANUAL COOKING MODE

WHEN THE TEMPERATURE OF THE BOTTOM OF THE POT EXCEEDS THE CRITICAL VALUE 250℃ TO 300℃, IT WILL AUTOMATICALLY CUT OFF & ALERT BEEP.

### AUTO COOKING PROGRAM

WHEN IT DETECTS THAT THE TEMPERATURE OF THE BOTTOM OF THE POT EXCEEDS 210℃, IT WILL AUTOMATICALLY SWITCH TO LOW HEAT.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 3;
-- 2023/11/VATTI-AI-Hob-C835G_11.webp
UPDATE product_image SET caption_md = '### SPINNING AND EVEN FIRE TECHNOLOGY

INNER FIRE COVER

DOUBLE LAYER STRAIGHT FLAME

OUTER FIRE COVER

WHIRLING FLAME

### 4.5KW POWERFUL FOR STIR FRY

HIGH EFFICIENCY AND ENERGY SAVING'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 4;
-- 2023/11/VATTI-AI-Hob-C835G_4.webp
UPDATE product_image SET caption_md = '### BLACK CRYSTAL GLASS PANEL

HIGH QUALITY BLACK TEMPERED GLASS PANEL

BETTER HEAT DISSIPATION, OIL STAINS CAN BE WIPED CLEAN

### POT AREA

ANTI-CORROSION DOUBLE-LAYER POND PORCELAIN LIQUID TRAY

ONE-PIECE CONVEX STRUCTURE DESIGN

### ANTI-LEAKAGE KNOB

THE KNOB IS EQUIPPED WITH HIGH TEMPERATURE RESISTANCE AND LEAKAGE PREVENTION'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 5;
-- 2023/11/VATTI-AI-Hob-C835G_3.webp
UPDATE product_image SET caption_md = '### BLACK CRYSTAL GOLD PANEL

DEEP BLACK GRADED GLASS PANEL AND GOLD TRIM

HIGH-END AND ELEGANT DESIGN

### BLACK JET ROTOR FIRE COVER

THE FIRE COVER CONSISTS OF 16 ROTATING WINGS

### ENAMEL CROSS FLAT STEEL POT HOLDER

MORE EFFECTIVELY & INCREASE THE FORCE AREA OF THE POT

WEAR-RESISTANT AND ANTI-CORROSION.

### ALL BRIGHT EDGE KNOBS

CNC HIGH-GLOSS GOLD KNOB

FEEL COOL AND NOT HOT, HIGH QUALITY.

THE ULTIMATE USER EXPERIENCE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 6;
-- 2023/11/VATTI-AI-Hob-C835G_6.webp
UPDATE product_image SET caption_md = '### SELF-CONTROL ANTI-DRY BURNING

### SMART ON-SCREEN REMINDER

WIDE-RANGE 99-MINUTE TIMED COOKING, PRECISE CONTROL OF THE BEST TIME FOR VARIOUS DISHES

TIMING REMINDER AND AUTOMATIC CUT-OFF OF GAS SOURCE AND FLAMEOUT.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 7;
-- 2023/11/VATTI-AI-Hob-C835G_2.webp
UPDATE product_image SET caption_md = '### 8-SPEED PRECISE FIRE CONTROL 400W-4500W FIRE POWER WIDE ADJUSTMENT

8 FIREPOWER CHANGES TO MEET ALL KINDS OF COOKING

- STIR-FRY
- DEEP FRY
- SOUP BOIL
- FRY
- GRILL
- STEWING
- SIMMER
- KEEP WARM

### EIGHT-SPEED CARD POSITION FEEL

TACTILE CARD POSITION FEEL MORE CONVENIENT TO ADJUST'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 8;
-- 2023/11/VATTI-AI-Hob-C835G_10.webp
UPDATE product_image SET caption_md = '### 3D OXYGEN INPUT DESIGN

### UPPER LEVEL

12 AIR INTAKE SLOTS SPIRAL THE TOP AIR

### MEDIUM LEVEL

THE SKELETONIZER GUIDES THE CENTRAL AIR

### LOWER LEVEL

WIDE DIAMETER PILOT TUBE SIPHONS THE BOTTOM AIR'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 9;
-- 2023/11/VATTI-AI-Hob-C835G_12.webp
UPDATE product_image SET caption_md = 'ACTUAL TEMPERATURE

TEMPERATURE SETTING

### POT MATCHING MODE

MATCHING DIFFERENT INTELLIGENT ALGORITHMS ACCORDING TO DIFFERENT POTS, MORE PRECISE TEMPERATURE CONTROL

- ALUMINUM POT
- IRON POT
- CASSEROLE POT'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g') AND position = 10;

-- vatti-oylimpic-hob-m822g — 7 of 9 images carry text
-- 2023/02/JPEG-5.gif
UPDATE product_image SET caption_md = '### INNOVATIVE MICRO-FLAME COMBUSTION TECHNOLOGY

3.5KW PRODUCE 1000℃'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND position = 2;
-- 2023/11/VATTI-Oylimpic-Hob-M821G_3.webp
UPDATE product_image SET caption_md = '### LEFT STEAMED RIGHT STIR-FRIED

### INNOVATIVE LEFT AND RIGHT PARTITION DESIGN'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND position = 3;
-- 2023/11/VATTI-Oylimpic-Hob-M821G_5.webp
UPDATE product_image SET caption_md = '### 3D OKSIGEN INPUT

### UPPER LEVEL

12 AIR INTAKE SLOTS SPIRAL THE TOP AIR

### MEDIUM LEVEL

THE SKELETONIZER GUIDES THE CENTRAL AIR

### LOWER LEVEL

WIDE DIAMETER PILOT TUBE SIPHONS THE BOTTOM AIR

### ROTATIONAL POLYTHERMAL FORCE

### INNER FLAME RING

DOUBLE LAYER FLAME

### EXTERNAL FLAME RING

FIRE CYCLE AROUND THE FLAME'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND position = 4;
-- 2023/11/VATTI-Oylimpic-Hob-M821G_10.webp
UPDATE product_image SET caption_md = '### PREMIUM KITCHEN DESIGN'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND position = 5;
-- 2023/11/VATTI-Oylimpic-Hob-M821G_4.webp
UPDATE product_image SET caption_md = 'THE BEIJING OYLIMPIC TORCH CAN RESIST STRONG WINDS OF 65KM PER-HOUR & HEAVY RAIN OF 55mm PER-HOUR'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND position = 6;
-- 2023/11/VATTI-Oylimpic-Hob-M821G_6.webp
UPDATE product_image SET caption_md = '### INNOVATIVE MICRO-FLAME COMBUSTION TECHNOLOGY

### OYLIMPIC PLATE DESIGN

13.6°

THE SURFACE IS NEARLY 10,000 PRECISION TINY FIRE HOLES

THE AIR OUTLET IS UNIFORM, AND THERE IS NO BLIND SPOT IN HEATING'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND position = 7;
-- 2023/11/VATTI-Oylimpic-Hob-M821G_9.webp
UPDATE product_image SET caption_md = '### SAFETY DEVICE PROTECTION TECHNOLOGY

ACCIDENTAL SHUTDOWN THE GAS VALVE AND CUT OFF THE GAS SUPPLY.

### HIGH QUALITY TEMPERED GLASS

HIGH TEMPERATURE & BREAK RESISTANCE

### AUTO IGNITIO

EASY & SAFETY IGNITION

### CHILD LOCK

BUILT-IN CHILD LOCK & MICRO SWITCH. THE KNOB MUST BE PRESSED DOWN & ROTATED COUNTERCLOCKWISE TO IGNITE THE IGNITION. TO AVOID ACCIDENTAL IGNITION BY CHILDREN.

### FIRE CONTROL DAMPER

SAVE GAS, SOLVE THE FLAME ABNORMALITY'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND position = 8;

-- vatti-flexi-hob-c822g — 8 of 11 images carry text
-- 2023/10/Vatti-Flexi-Hob-C822G-Product-description-_1_.webp
UPDATE product_image SET caption_md = '### Free Die-cut Size Built-in Available, Smart Timer to Manage Powerful Cooking

C822G

- Timer Setting Available
- Powerful Wok Burners
- High Efficiency
- Free Die-cut Size
- Detachable Burner for Easy Clean
- Flame Failure Devices'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND position = 3;
-- 2023/10/Vatti-Flexi-Hob-C822G-Product-description-_2_.webp
UPDATE product_image SET caption_md = '### High Firepower for Quick Stir-frying

Flame wraps the bottom of the pot, the ingredients are cooked quickly, shortening the cooking time, and enjoying the delicious food

Stir-fry with 5.2kW
Wok frying flavor

Ordinary gas stove
Stir-fry with slow fire, no tasty'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND position = 4;
-- 2023/10/Vatti-Flexi-Hob-C822G-Product-description-_3_.webp
UPDATE product_image SET caption_md = '### Torch-level Co-combustion Technology

VATTI C822G High Flame Hob

Smart timing
No need waiting aside, more freedom to cook

5.2kW large firepower
Stir-fry with high heat and cook quickly

First-level energy efficiency
Big firepower without spending a lot of energy

Free adaptable die-cut size
Easy replacement

Detachable burner
Easy to disassemble Easy to clean

Thermocouple flameout protection
Quick response, safe and secure

Ordinary gas hob

No timing function
Sticking to the stove, time-consuming and distracting

Insufficient firepower of 4.5kW
Stir-fry becomes slow stew

Secondary energy efficiency
High energy consumption, not economic

Fixed die-cut size
It is troublesome to re-open the hole

Fixed burner
Inconvenient to clean, dead corners are difficult to clean

No safety device
Not safe and secure'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND position = 5;
-- 2023/10/Vatti-Flexi-Hob-C822G-Product-description-_9_.webp
UPDATE product_image SET caption_md = '### Anti-scratch & Anti-explosion Tempered Glass, Easy to Resist Oil & Dirt

Easy to clean and durable, worry-free after meals

- No oil stains
- Anti-scratch
- High temperature resistance

### X-shaped Non-slip Pan Support, Stir-frying & Cooking Without Slipping Pot

Say goodbye to cooking accidental movement, cook firmly and hold the bottom of the pot without slipping

- It is not firm
- It is easy to roll over
- It is too laborious to hold the handle for a long time'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND position = 6;
-- 2023/10/Vatti-Flexi-Hob-C822G-Product-description-_4_.webp
UPDATE product_image SET caption_md = '### Free Time Cooking

Set a fixed time,
no matter whether it is steaming
or slow stewing, you don''t
need to watch it, turn off the fire
when timing end, and
guard your kitchen safely

- Steam for 8 minutes
- Stew for 20 minutes
- Braise for 99 minutes'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND position = 7;
-- 2023/10/Vatti-Flexi-Hob-C822G-Product-description-_7_.webp
UPDATE product_image SET caption_md = '### Detachable Design, 360-degree Easy Cleaning

The burner is detachable, and the scattered soup, oil, and crumbs can be easily cleaned up, and the blind spots of dirt can be removed

Brass burner lids
high temperature resistance, not easy to deform

Aviation-grade burner cap
Durable and corrosion-resistant

Cool black and easy-to-clean drill pan, easy clean design
Square drill pan, high-temperature ceramic glaze refining,stable and not pot slippery,stylish and corrosion-resistant'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND position = 8;
-- 2023/10/Vatti-Flexi-Hob-C822G-Product-description-_10_.webp
UPDATE product_image SET caption_md = '### Create Every Details

Desk-embedded dual-purpose
No restrictions on replacement

Anti-leakage knob pad
Prevent residue and grease from falling into the base shell, easy to clean

Easy-to-remove battery box
Easy to remove and replace

Adjustable damper
Stable flame and more gas-saving'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND position = 9;
-- 2023/10/Vatti-Flexi-Hob-C822G-Product-description-_5_.webp
UPDATE product_image SET caption_md = '### 63% Thermal Efficiency, Energy-saving

First-class energy efficiency, higher combustion rate, high firepower and low emission, cooking is more energy-saving and environmentally friendly

63%

### Quickly Ignite, No Need Wait Long Time for Ignition

The pulse electronic ignition can ignite quickly, saving energy and trouble, allowing the family to enjoy the pleasure of cooking

Zinc alloy knob, exquisite and luxurious texture'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND position = 10;

-- vatti-flexi-hob-c823g — 6 of 8 images carry text
-- 2025/07/C823G-PG-1.webp
UPDATE product_image SET caption_md = '### Powerful Flame Flexi cut Size

C823G'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g') AND position = 2;
-- 2025/07/C823G-PG-3.webp
UPDATE product_image SET caption_md = '### 63% Thermal Efficiency Energy-saving

- 30°
- 38°'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g') AND position = 3;
-- 2025/07/C823G-PG-5.webp
UPDATE product_image SET caption_md = '### Safety Failure Device

Automatic gas cut-off

### Zero Sec Ignition

No Need To Wait Long Time For Ignition'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g') AND position = 4;
-- 2025/07/C823G-PG-2.webp
UPDATE product_image SET caption_md = '### 4.8KW High Firepower for Quick Stir-frying

Burner Lid 38 Degree Angle To Increase Firepower

Upgrade Air Supply Chain With Sufficient Fire Power To Stir-fry Without Burning The Pot'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g') AND position = 5;
-- 2025/07/C823G-PG-4.webp
UPDATE product_image SET caption_md = '### Adaptable Flexi Cut Free to Make a Replacement

- 650mm
- 710mm
- 350mm
- 400mm

front view die-cut size is compatible with the above range

- 710mm
- 650mm

front view die-cut size is compatible with the above range

- 400mm
- 350mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g') AND position = 6;
-- 2025/07/C823G-PG-7.webp
UPDATE product_image SET caption_md = '### Specification

- Product code: C823G
- Power (kW): 4.8KW
- Thermal Efficiency: 63%
- Ignition: Auto Ignition
- Flame Failure Device: Thermo couple
- Dimension(mm): 750*450*146
- Recommended Standard Die-cut Size: (650 - 710) x (350 - 400)
- Net/Gross weight(kg): 13.6/16.0 kg'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g') AND position = 7;

-- vatti-flexi-hob-c836g — 13 of 15 images carry text
-- 2025/12/Vatti-cooker-hob-C836G-product-description-1.webp
UPDATE product_image SET caption_md = '### SMART SMOKE EXTRACTION

### POWERFUL FLAME UPGRADE

Smart Precision Control'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 2;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-3.webp
UPDATE product_image SET caption_md = '### Wide-Range Precision Timer

Long Simmering, No Need to Watch

0–180 min Dual-Zone Timer

Precisely controls the ideal cooking time for different dishes. Manage your time efficiently, reduce waiting, and enjoy worry-free cooking.

- 10 min — Get ready and change clothes. Breakfast will be ready to enjoy
- 60min — Set and relax. Tender, slow-braised meat
- 180 min — Nutritious slow-cooked soup. Perfectly ready when time is up'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 3;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-5.webp
UPDATE product_image SET caption_md = '### Smart Temperature Detection

Precise Control, Worry-Free Cooking

### Left Smart Burner

One-touch assisted cooking for easier, smarter stir-fry

- Oil Temp 290˚C
- Mode Stir-Fry

### Hot Oil Protection

Auto mode detects oil at target temperature.

### Empty Pan Protection

High-heat manual mode. Flame reduces automatically

### Dry-Burn Protection

Sensitive temperature sensor detects rapid heat change'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 4;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-7.webp
UPDATE product_image SET caption_md = '### Multiple Easy-Clean Design

Hassle-Free Cleaning After Cooking

Human-centered design for easier maintenance. Quick disassembly, effortless cleaning, no hard-to-reach blind spots.

### Concave Flame Cap Design

Guides spills and soup overflow
Prevents clogging

### Integrated Removable Burner Head

Deep cleaning made easy
Prevents grease and residue buildup

### Smooth Rounded Wok Support

Easy to clean
No hidden corners for dirt accumulation

### Raised Condensate & Spill Tray

Directs overflow outward
Easy wipe-down after cooking'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 5;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-9.webp
UPDATE product_image SET caption_md = '### Flame-Focusing Wok Support

Heat Insulation & Cooling · More Stable Cooking

The flame stays concentrated and steady, improving heat efficiency. Less heat loss, faster stir-frying, and a more stable grip for all types of cookware.

### Anti-Slip Locking Tabs

Enhanced grip for better stability
Keeps the wok firmly in place.

### Reinforced Edges

Thicker and stronger construction
Resists deformation over time

### Curved Drainage Grooves

Guides soup, oil, and spills away
Easier cleaning and better hygiene.

### Flame-Focusing Wok Support

- More-corrosion-resistant material
- Smooth, rounded surface for easy cleaning
- Locking tabs improve wok stability
- Thickened edges for added durability

### Ordinary Four-Leg Wok Support

- Poor flame concentration, low heat efficiency
- No heat insulation, cookware gets overheated
- Food residue easily accumulates, hard to clean
- No locking support, wok can wobble'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 6;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-11.webp
UPDATE product_image SET caption_md = '### Triple–Ring Intense Flame

One More Ring Than Dual-Ring

Even Heat Across the Wok • No Burning, Better Taste

Dual-ring burners deliver stronger flames on the inner and outer rings, but leave a heat gap in the center. The added third ring fills this gap, expanding the combustion area, balancing heat distribution, and eliminating undercooked spots, Fast searing, even doneness, no charring — Healthier cooking with consistent results.

### Inner Ring – Concentrated Heat

Balanced and stable flame
Fast, even heat penetration

### Middle Ring – Even Heat Balance

Compensates for heat gaps
Ensures uniform temperature

### Outer Ring – Wide Heat Coverage

Expands combustion area by 11%
Greater flame coverage for large cookware

### A New Cooking Experience

Healthy Dishes with Real Wok Hei

- Triple-Ring Intense Flame — More even flame distribution
- Ordinary 3D Flame — Overlapping flames'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 7;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-13.webp
UPDATE product_image SET caption_md = '### Master the Flame, Master the Flavor

It embodies the art of precise flame control — gentle and steady for slow simmering, powerful and responsive for high-heat stir-frying.

Every turn of the control knob is a precise calculation of heat and timing, activating food molecules at it their best, turning every cooking moment into something worth anticipating.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 8;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-2.webp
UPDATE product_image SET caption_md = '### Nano Anti-Stain Glass Surface

No Oil Marks · No Water Stains

Vatti applies a nano-polymer water-and oil-repellent coating that effectively reduces grease adhesion and fingerprint residue. Scratch-resistant and wear-resistant for daily use — one wipe restores a like-new finish.

- Easy to Clean
- Anti-Fingerprint
- Oil-Resistant
- No Stain Marks
- Extra-Smooth Surface

### Oil & Water Repellency Test

Without Coating — Oil droplets spread and stick to the surface

Nano Oil-Repellent Coating — Oil forms beads and slides off easily'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 9;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-4.webp
UPDATE product_image SET caption_md = '### No Modification Required · Install with Ease

Fits Multiple Cut-Out Sizes

Adjustable base design accommodates a wider range of cut-out dimensions. Easy replacement without re-cutting the countertop — simple, hassle-free installation.

- 650 – 700mm
- 350 – 400mm

### Front Cut-Out Compatibility Range

- 710mm · 650mm

### Side Cut-Out Compatibility Range

- 400mm · 350mm

*Within the compatible cut-out size range, replacement can be done without modifying the countertop.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 10;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-6.webp
UPDATE product_image SET caption_md = '### AI Hood–Hob Linkage

Automatic Smoke Extraction When Cooking Starts

When the hob ignites, the cooker hood activates automatically — powerfully extracting smoke with no lingering odors.

Low Flame — Lower Suction Power

High Flame — Stronger Suction Power

- This function requires pairing with a compatible Vatti cooker hood to enable hood–hob linkage.
- When the hob is ignited, the hood automatically activates "Smart Sensing Mode" for intelligent smoke extraction.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 11;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-8.webp
UPDATE product_image SET caption_md = '### 30+ Years of Combustion Technology Expertise

Precision Craftsmanship · Durable & Deformation-Resistant

Crafted with dedication and strict material selection. Tested in proprietary standardized professional laboratories to ensure stable, long-lasting performance you can rely on.

### Copper Burner Cap

High-Temperature Resistant · Maintains Shape

Stainless Steel Burner Cap

Iron Burner Cap

### High-Quality Burner Body

Corrosion-Resistant · Longer Lifespan

Standard Alloy Burner Body

Traditional Burner Body'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 12;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-10.webp
UPDATE product_image SET caption_md = '### 5.5 kW High-Power Flame

Instantly Aroma Release

Powerful heat surges instantly through the wok, activating the Maillard reaction in seconds.

Ingredients are seared fast, locking in nutrition while unleashing rich, bold wok hei flavor.

- Natural Gas: 5.5 kW
- LPG: 5.0 kW'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 13;
-- 2025/12/Vatti-cooker-hob-C836G-product-description-12.webp
UPDATE product_image SET caption_md = '### Master-Level 5-Step Precision Flame Control

"Click" — Perfect Heat, Instantly

5-step mechanical precision control delivers real tactile feedback. Accurate flame levels for gentle simmering or powerful stir-frying. No more vague, stepless adjustment — effortlessly master aroma, texture, and flavor in every dish.

### Level 1 Gentle Simmer

Low heat for soups and sauces

### Level 4 Quick Stir-Fry

Fast heating, quick to boil water

### Intense Stir-Fry

Maximum flame for richer flavor

### Quick Stir-Fry

High heat locks in aroma

### 5 Flame Levels · One Precise Control Knob

Precise Heat Control for Every Texture

- Level 1 Medium Rare Seared Steak — Juicy, tender, and delicate texture
- Level 3 Medium Seared Steak — Balanced texture, rich layers
- Level 5 Medium Well Seared Steak — Firm texture with satisfying bite'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g') AND position = 14;

-- vatti-3-burner-gas-hob-c830g — 7 of 9 images carry text
-- 2023/10/Vatti-3-burner-gas-hob-C830G-Product-description-1.webp
UPDATE product_image SET caption_md = '### Mastering Your Cooking Moment

### VATTI Powerful Cooker Hob With Timer Setting'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g') AND position = 2;
-- 2023/10/Vatti-3-burner-gas-hob-C830G-Product-description-_7_.webp
UPDATE product_image SET caption_md = '### Brass Burner Lids

High Temperature Resistance'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g') AND position = 3;
-- 2023/10/Vatti-3-burner-gas-hob-C830G-Product-description-_4_.webp
UPDATE product_image SET caption_md = '### 99 Minutes Timer'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g') AND position = 4;
-- 2023/10/Vatti-3-burner-gas-hob-C830G-Product-description-_6_.webp
UPDATE product_image SET caption_md = '### 1059g

Energy-concentrated Pan Support

1. Widen the pan support shield to keep out the wind, keep the flame stable, strong and firm
2. Protect the knobs, reduce heat spillage, and gather energy for heat insulation'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g') AND position = 5;
-- 2023/10/Vatti-3-burner-gas-hob-C830G-Product-description-_2_.webp
UPDATE product_image SET caption_md = '### Available For 3 Dishes At The Same Time

- Powerful Stir fry
- Slow Braise
- Medium Stew'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g') AND position = 6;
-- 2023/10/Vatti-3-burner-gas-hob-C830G-Product-description-_3_.webp
UPDATE product_image SET caption_md = '### 6KW Powerful Flame'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g') AND position = 7;
-- 2023/10/Vatti-3-burner-gas-hob-C830G-Product-description-_5_.webp
UPDATE product_image SET caption_md = '### Triple safety test

Hot and cold shock, gravity shock, violent shock

### Energy-gathering pan support

High-efficiency heat insulation, windproof and more stable

### Safety child lock

Push-type rotary ignition, anti-child opening

### Three-layer tempered glass panel

Explosion-proof, heat insulation and impact resistance

### Thermocouple flameout protection

Automatically shut off the gas source when the flameout is accidental

### Pulse electronic ignition

Rapid ignition

### X-shaped pot support

Firm and non-slip'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g') AND position = 8;

-- vatti-magic-series-cooker-hob-c861g — 9 of 12 images carry text
-- 2024/04/Slide1-1.jpg
UPDATE product_image SET caption_md = '### FLIP-UP BURNER, SUBVERSIVE COGNITION, SUPER EASY CLEAN

MAGIC STOVE C861G'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 3;
-- 2024/04/Slide2-1.jpg
UPDATE product_image SET caption_md = '### REVERSIBLE BURNER

90° VERTICAL REVERSIBLE BURNER HEAD

90° DEGREE VERTICAL

Patended Number: ZL201921462957.2

### SUPER EASY CLEAN

### SAVE SPACE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 4;
-- 2024/04/Slide3-1.jpg
UPDATE product_image SET caption_md = '### REVERSIBLE BURNER

90° VERTICAL REVERSIBLE BURNER HEAD

90° DEGREE VERTICAL

Patended Number: ZL201921462957.2

### OXYGEN BLOCKING

### MULTIPLE SUSPENSION O2 INJECTION'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 5;
-- 2024/04/Slide4-1.jpg
UPDATE product_image SET caption_md = '### FULL TOUCH SCREEN CONTROL INTERFACE

360° no dead angle easy to clean experience, integrated minimalist beauty'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 6;
-- 2024/04/Slide10-1.jpg
UPDATE product_image SET caption_md = '### 4.8KW HIGH POWER

65% first-class energy efficiency, high efficiency and energy saving can stir-fry vigorously and save gas

### Seven Gears for Precise control of firepower

7 levels of precise temperature control: 400W-4800W wide range of heat adjustment, easy to control 7 types of heat changes to meet all kinds of cooking

- DEEP FRY
- QUICK FRY
- STEAM
- GRILL
- STEW
- BOIL
- KEEP WARM'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 7;
-- 2024/04/Slide5-1.jpg
UPDATE product_image SET caption_md = '### Easy Clean'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 8;
-- 2024/04/Slide7-1.jpg
UPDATE product_image SET caption_md = '### SENSOR DETECTION

The sensor detect the content in the pot. It will set to the highest Setting when it is to cold.

Sensor will lower down when it detected content To hot in the pot.

When sensor detected content has reduce it''s heat it will increase heat to maintain the content inside.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 9;
-- 2024/04/Slide8-1.jpg
UPDATE product_image SET caption_md = '### INTELLIGENT COOKING MANAGEMENT

INTELLIGENT ASSISTED COOKING
COOKING IN LEFT AND RIGHT ZONES

ACTUAL TEMPERATURE

SETTING TEMPERATURE

### Overflow

### Burn Dry'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 10;
-- 2024/04/Slide9-1.jpg
UPDATE product_image SET caption_md = '### INTELLIGENT TEMPERATURE DETECTION

The anti-dry burning burner on the left has a built-in highly sensitive temperature probe that intelligently monitors the temperature changes at the bottom of the pot Before dry burning, the stove automatically cuts off the air source and buzzes the alarm to avoid potential safety hazards.

### HOT OIL PROTECTION

In the event of hot oil burnig on the pan with no one around. The sensor will detect the up comming danger, and will automatically shout off the fire.

### EMPTY POT PROTECTION

After the removing your pots or pan from the burner for period of time.The sensor will detect and automatically shout off by it self.

### DRY BURN PROTECTION

Sensor detected the pan over heating at the bottom, then will start beeping awhile and automatically shout off by it self.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g') AND position = 11;

-- vatti-built-in-oven-o7549 — 4 of 7 images carry text
-- 2023/11/Built-in-Oven-O754-7.webp
UPDATE product_image SET caption_md = '### VATTI PROFESSIONAL CONVENTION OVEN O7549'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o7549') AND position = 3;
-- 2023/11/Built-in-Oven-O754-5.webp
UPDATE product_image SET caption_md = '### YOU CAN PREPARE MULTIPLE MEALS AND PANS OF BAKED GOODS SIMULTANEOUSLY

75L'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o7549') AND position = 4;
-- 2023/11/Built-in-Oven-O754-1.webp
UPDATE product_image SET caption_md = '### 9 PROFESSIONAL BAKING MODE

SATISFY ALL YOU NEED'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o7549') AND position = 5;
-- 2023/11/Built-in-Oven-O754-2.webp
UPDATE product_image SET caption_md = '### EASY DISASSEMBLY DOOR

SPECIAL LATCHES FOR QUICK AND EASY DISASSEMBLY WITHOUT ANY TOOLS

### 3 LAYER LOW E GLASS DOOR

STRONG HEAT RESISTANCE

### HIGH QUALITY ENAMEL COATING

ENAMEL LINER CREATES A VERY SMOOTH SURFACE, SO GREASE AND DIRT HAVE A HARDER TIME STICKING TO IT.

### 75L BIG CAPACITY WITH 5 LAYER.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o7549') AND position = 6;

-- vatti-built-in-oven-o755p — 7 of 9 images carry text
-- 2023/11/Built-in-Oven-O755P-3.webp
UPDATE product_image SET caption_md = '### VATTI BUILT-IN OVEN O755P'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o755p') AND position = 2;
-- 2023/02/O755P-PRESENTATION-8.gif
UPDATE product_image SET caption_md = '### VATTI CERAMIC NON-STICKY SUPER EASY CLEAN OVEN

SPECIAL SURFACES ARE SCRATCH-RESISTANT AND NON STICK.

IT''S SUPER EASY TO CLEAN AND IT KEEPS THINGS SIMPLE AND SAVE YOUR TIME.

Conventional Enamel

VATTI Easyclean Ceramic'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o755p') AND position = 3;
-- 2023/11/Built-in-Oven-O755P-4.webp
UPDATE product_image SET caption_md = '### 11 PROFESSIONAL BAKING MODE

SATISFY ALL YOU NEED'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o755p') AND position = 4;
-- 2023/11/Built-in-Oven-O755P-2.webp
UPDATE product_image SET caption_md = '### YOU CAN PREPARE MULTIPLE MEALS AND PANS OF BAKED GOODS SIMULTANEOUSLY

75L'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o755p') AND position = 5;
-- 2023/07/O755P-PRESENTATION-7.gif
UPDATE product_image SET caption_md = '### VATTI TELESCOPIC RUNNERS

HELP TO INCREASE THE SAFETY OF AN OVEN AND MAKE IT MUCH MORE USER FRIENDLY

SHELVES SLIDE TO YOU AND SECURE IN PLACE

### VATTI SOFT OPEN & SOFT CLOSE DOOR

GENTLE DOOR MOVEMENT. A REAL EYE-CATCHER: THE DOOR FEATURES A SOPHISTICATED CUSHIONING MECHANISM FOR ELEGANT OPENING AND CLOSING.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o755p') AND position = 6;
-- 2023/11/Built-in-Oven-O755P-5.webp
UPDATE product_image SET caption_md = '### CHILD LOCK

SPECIAL CHILD SAFETY PROGRAMME, WHICH ENABLES THE CONTROL PANEL OF OVEN TO BE "LOCKED" SO THAT CHILDREN CANNOT OPERATE IT ACCIDENTALLY.

### ALARM ALERT

TIMER ALERT

### EASY DISASSEMBLY DOOR

SPECIAL LATCHES FOR QUICK AND EASY DISASSEMBLY WITHOUT ANY TOOLS

### 4 LAYER LOW E GLASS DOOR

STRONG HEAT RESISTANCE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o755p') AND position = 7;
-- 2023/11/Built-in-Oven-O755P-6.webp
UPDATE product_image SET caption_md = '### 75L BIG CAPACITY WITH 5 LAYER.

### PRODUCT DIMENSION

- 595mm
- 595mm
- 563mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-oven-o755p') AND position = 8;

-- vatti-built-in-air-fryer-oven-07559 — 6 of 7 images carry text
-- 2024/08/Built-in-air-fryer-oven-07559-product-description-4.webp
UPDATE product_image SET caption_md = '### EASY DISASSEMBLY DOOR

SPECIAL LATCHES FOR QUICK AND EASY DISASSEMBLY WITHOUT ANY TOOLS

### 3 LAYER LOW E GLASS DOOR

STRONG HEAT RESISTANCE

### HIGH QUALITY ENAMEL COATING

ENAMEL LINER CREATES A VERY SMOOTH SURFACE, SO GREASE AND DIRT HAVE A HARDER TIME STICKING TO IT.

### 75L BIG CAPACITY WITH 5 LAYER.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND position = 1;
-- 2024/08/Built-in-air-fryer-oven-07559-product-description-2.webp
UPDATE product_image SET caption_md = '### AIRFRY

Double wall-mounted M-shaped heating elements on the top provide even heat and release the upper space

Back heating element'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND position = 2;
-- 2024/08/Built-in-air-fryer-oven-07559-product-description-5.webp
UPDATE product_image SET caption_md = '### PRODUCT DIMENSION

- Width: 598mm
- Height: 592mm
- Depth: 577mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND position = 3;
-- 2024/08/Built-in-air-fryer-oven-07559-product-description-3.webp
UPDATE product_image SET caption_md = 'YOU CAN PREPARE MULTIPLE MEALS AND PANS OF BAKED GOODS SIMULTANEOUSLY

### 75L'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND position = 4;
-- 2024/08/Built-in-air-fryer-oven-07559-product-description-1-1.webp
UPDATE product_image SET caption_md = '### BUILT-IN AIRFRY OVEN - 07559'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND position = 5;
-- 2024/08/Built-in-air-fryer-oven-07559-product-description-1.webp
UPDATE product_image SET caption_md = '### 9 PROFESSIONAL BAKING MODE

SATISFY ALL YOU NEED'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND position = 6;

-- free-standing-combi-oven-va01 — 4 of 5 images carry text
-- 2023/11/Free-Standing-Combi-Oven-VA01-1.webp
UPDATE product_image SET caption_md = '### VATTI FREE STANDING COMBI OVEN'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'free-standing-combi-oven-va01') AND position = 1;
-- 2023/07/VA01-PRESENTATION-5.gif
UPDATE product_image SET caption_md = '### VATTI STEAM + GRILL COMBI FUNCTION

100 ℃– 230℃ GRILL + STEAM
MORE TENDER & DELICIOUS'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'free-standing-combi-oven-va01') AND position = 2;
-- 2023/11/Free-Standing-Combi-Oven-VA01-2.webp
UPDATE product_image SET caption_md = '### ONE MACHINE WITH MULTIPLE ABILITIES

- FERMENTATION
- YOGURT
- KEEP WARM
- DEHYDRATION
- DEFROST
- DESINFECT

### THE INTELLIGENT MENU

REFERENCE, TEMPERATURE & TIME
CAN BE ADJUSTED IN PROFESIONAL MODE
ACCORDING TO THE AMOUNT OF FOOD, PERSONAL
TASTE & COOKING EXPERIENCE.

1 egg

| STEAM EGG | °C | times |
| --- | --- | --- |
| SOFT | 70 | 8min |
| MEDIUM | 110 | 3min |
| HARD | 110 | 9 min |

3 egg

| STEAM EGG | °C | times |
| --- | --- | --- |
| SOFT | 70 | 13min |
| MEDIUM | 110 | 3min |
| HARD | 110 | 11min |

5 egg

| STEAM EGG | °C | times |
| --- | --- | --- |
| SOFT | 70 | 15min |
| MEDIUM | 110 | 3min |
| HARD | 110 | 15 min |'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'free-standing-combi-oven-va01') AND position = 3;
-- 2023/02/Picture1.gif
UPDATE product_image SET caption_md = '厨艺了得

### 1200W 桑拿蒸

### 锁鲜减脂保营养

304不锈钢快速导热材质，
预热30s出蒸汽

注: *30S指在特定条件下的华帝实验室数据'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'free-standing-combi-oven-va01') AND position = 4;

-- built-in-combi-oven-va03 — 10 of 12 images carry text
-- 2023/11/Built-in-Combi-Oven-VA03-3-1.webp
UPDATE product_image SET caption_md = '### THE PROFESSIONAL COMBI OVEN IN THE MARKET VA03

COMBI STEAM BAKE

3 LEVEL HUMIDITY

3D CONVENTION

DUAL TEMPERATURE

MULTI STEP RECIPE

INTELLIGEN COOKING MODE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 2;
-- 2023/11/Built-in-Combi-Oven-VA03-5-1.webp
UPDATE product_image SET caption_md = '1.3L EXTERNAL WATER TANK DESIGN

TOP HEATING TAPE NO WATER DROPPPING

INTEGRATED SEAMLEE DESIGN EASY TO CLEAN

BOTTOM HEATING PLATE DOUBLE STEAM & NO CONDENSED WATER AT BOTTOM

### EXTERNAL WATER TANK

EASY REFILL WATER & BIG CAPACITY

### WATER NO DROP AT SURFACE

INTEGRATED  SEAMLEE DESIGN EASY TO CLEAN

WATER  NO DRIP AT BOTTOM'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 3;
-- 2023/11/Built-in-Combi-Oven-VA03-7-1.webp
UPDATE product_image SET caption_md = '### VATTI DUAL TEMPERATURE CONTROL

THE INDEPENDENT TEMPERATURE BAKING CONTROL AT TOP & BOTTOM

TOP & BOTTOM HEAT CAN INDEPENDENTLY ADJUST THE CONTROL ITS OWN TEMPERATURE

EACH PART OF THE DELICIOUS FOOD CAN RELEASE THE MOST PERFECT TASTE IN ITS MOST SUITABLE BAKING TEMPERATURE.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 4;
-- 2023/11/Built-in-Combi-Oven-VA03-9-1.webp
UPDATE product_image SET caption_md = '### 68 AUTO MENU

MASTER CHEF RECIPES

FERMENTATION

YOGURT

STEAM RICE

KEEP WARM

DEFROST

SELF CLEAN

AUTO CLEAN'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 5;
-- 2023/11/Built-in-Combi-Oven-VA03-12-1.webp
UPDATE product_image SET caption_md = 'VATTI ALWAYS USER-FRIENDLY DESIGN

CUSTOMER ORIENTED & THOUGHTFUL DESIGN

### BLUE ENAMEL PANEL

RESISTANT HIGH TEMPERARURE & SMOOTH SURFACE EASY TO CLEAN

### AUTO CLEAN

HIGH STEAM TEMPERARURE WASHERS INNER CHAMBER  TO SOFTEN THE GREASE & KILL BACTERIA

BACTERIOSTATIC  DRYING HIGH TEMPERATURE  DRYING & LONG LASTING BACTERIOSTATIC

### ALARM ALERT

TIMER ALERT

LACK OF WATER ALERT

ERROR ALERT

### 3 LAYER GLASS DOOR

LOW E- GLASS STRONG HEAT RESISTANCE SAFETY'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 6;
-- 2023/11/Built-in-Combi-Oven-VA03-4-1.webp
UPDATE product_image SET caption_md = '### VATTI DOUBLE NOZZLE STEAM TECHNOLOGY

COMPETITIVE BRAND ON THE MARKET UPPER STEAM PRESSURE DESIGN

LARGE STEAM LOSS RATE & LOW EFFICIENCY.

WATER DROPPING FOOD SURFACE WET.

VATTI THE LATEST VERSION SIDE DOUBLE PRESSURE NOZZLE DESIGN

- MORE EFFICIENCY & EFFECTIVE STEAM HEAT.
- WITHOUT WATER DROPPING FOOD SURFACE WET.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 7;
-- 2023/11/Built-in-Combi-Oven-VA03-6-1.webp
UPDATE product_image SET caption_md = '### VATTI MULTI DIMENSION & HIGH TEMPERATURE 3D CONVENTION BAKING

UPPER MULTI DIMENSION BAKING TUBE

3D DIMENSION HOT AIR CIRCULATION

BOTTOM DUAL DIMENSION BAKING TUBE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 8;
-- 2023/11/Built-in-Combi-Oven-VA03-8-1.webp
UPDATE product_image SET caption_md = '### VATTI COMBI FUNCTION STEAM + OVEN 3 LEVEL HUMIDITY CONTROL

HIGH HUMIDITY MEAT

MEDIUM HUMIDITY CHICKEN

LOW HUMIDITY VEGETABLE

HIGH HUMIDITY JUICY

LOW HUMIDITY CRISPY

MEDIUM HUMIDITY TENDER'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 9;
-- 2023/11/Built-in-Combi-Oven-VA03-10-1.webp
UPDATE product_image SET caption_md = '### PARAMETERS ACCORDING TO THE COMPONENT

1 egg — STEAM EGG / °C / times: SOFT 70 8min; MEDIUM 110 3min; HARD 110 9 min

3 egg — STEAM EGG / °C / times: SOFT 70 13min; MEDIUM 110 3min; HARD 110 11min

5 egg — STEAM EGG / °C / times: SOFT 70 15min; MEDIUM 110 3min; HARD 110 15 min

### VATTI INTELLIGENT MULTI STEP COOKING

AUTOMATICALLY SET THE OPTIMAL COOKING COMBINATION MODE

COOKING IS MORE DELICIOUS & NUTRITIOUS

FIRST STEP LOW HEAT STEAM

SECOND STEP TOP & BOTTOM HEAT

THIRD STEP HIGH HEAT STEAM'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 10;
-- 2023/11/Built-in-Combi-Oven-VA03-11-1.webp
UPDATE product_image SET caption_md = '### 14 TYPE PROFESSIONAL COOKING FUNCTION

3 TYPES STEAM FUNCTION

1. LOW STEAM
2. STANDARD STEAM
3. HIGH STEAM

8 TYPES OVEN FUNCTION

1. TOP & BOTTOM  GRILL
2. TOP GRILL
3. MAX GRILL
4. CONVENTION
5. FAN GRIL
6. TOP & FAN GRILL
7. CLASSIC HEAT
8. BOTTOM  GRILL

ADDITIONAL

DUAL TEMPERATURE

TENDER ROAST

CRISPY ROAST'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va03') AND position = 11;

-- built-in-combi-oven-va05 — 9 of 11 images carry text
-- 2023/11/VA05-PI1.webp
UPDATE product_image SET caption_md = '### OVERALL MASTERLY BAKING PERFORMANCE,

### INTELLIGENT COOKING EXPERIENCE

VATTI "Orla Combo" Smart Steam & Bake Oven VA05'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 2;
-- 2023/11/VA05-PI12.webp
UPDATE product_image SET caption_md = '### Two practical mode

Easy maintenance

### Intelligent descaling:

One-key steam descaling, more worry-free cleaning after use

### Intelligent drying:

One-key automatic drying steam water, clean is easier'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 3;
-- 2023/11/VA05-PI11.webp
UPDATE product_image SET caption_md = '### High-quality enamel cavity anti-corrosion and wear-resistant and easy to maintain

Easy to clean after cooking, the cavity looks brand new'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 4;
-- 2023/11/VA05-PI5.webp
UPDATE product_image SET caption_md = '### The top and bottom independent temperature control the grilled chicken is crispy on the top and tender on the bottom

shaping multi-level changes in the taste of  ingredients, professional baking experience

### Upper pipe temperature < lower pipe temperature

The pizza filling is soft and the bottom is crispy

### Top and bottom independent control

The temperature difference is as high as 20℃, realizing the multi-layered taste of food'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 5;
-- 2023/11/VA05-PI3.webp
UPDATE product_image SET caption_md = '### High Quality Cooking Experience

Steam & Baking 2 in 1, Professional Cooking at Home
Elegant Appearance Design for Smart Kitchen

### Professional Master Baking'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 6;
-- 2023/11/VA05-PI4.webp
UPDATE product_image SET caption_md = '### Smart cooking with food probe you can cook the tasty food at home

User benefits: accurately monitor the internal temperature of food and easily control the doneness of steak

- 50℃
- 55℃
- 60℃
- 65℃
- 85℃

### Intelligent temperature sensing

Once the set temperature is reached, the oven will automatically stop working, and the food temperature can be precisely controlled.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 7;
-- 2023/11/VA05-PI6.webp
UPDATE product_image SET caption_md = '### Overall-dimensional baking system

Uniform internal temperature, professional cooking

### Full-dimensional heating element

Top double elements + back element + U-shaped bottom element, fast heating and uniform food coloring

### 4D fan

Speed up the heating and balance the heat evenly, and ensure the same temperature in the same layer'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 8;
-- 2023/11/VA05-PI7.webp
UPDATE product_image SET caption_md = '### Delicious & Fresh Professional Steaming

Preserve the nutrition of ingredients, keep fresh and enjoy delicious food

### Double steam 360-degree coverage, food enjoys the sauna

Nutrition and taste are retained, the food is fresh, juicy, and delicious

### Double steam outlet design

High-efficiency steam generation, equipped with double steam outlets, the surrounding steam quickly fills the cavity, and the three-dimensional convection fully surrounds the food'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 9;
-- 2023/11/VA05-PI14.webp
UPDATE product_image SET caption_md = '### Specification

- Width: 595mm
- Height: 595mm
- Depth: 563mm
- Model No.: VA05
- Rating Power: 3000 W
- Rating Voltage : 220-240V
- Capacity: 70 L
- Frequency: 50-60Hz
- Product Size: 595 x 595 x 563 mm
- Built-in Size: (W)560x(D)550x(H)595'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05') AND position = 10;

-- vatti-magic-series-combi-oven-va06 — 27 of 29 images carry text
-- 2024/04/Slide1-2.jpg
UPDATE product_image SET caption_md = '### THE FIRST 5 IN 1 COMBI OVEN IN THE MARKET'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 2;
-- 2024/04/Slide2-2.jpg
UPDATE product_image SET caption_md = '### 5 IN 1 COMBI OVEN

STEAM

STEW

BAKE

AIR-FRY

STEAM BAKE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 3;
-- 2024/04/Slide3-2.jpg
UPDATE product_image SET caption_md = '### COLORFUL HIGH-DEFINITION TOUCH SCREEN

THE FUNCTIONAL PARTITION CONTROL IS CLEAR AT A GLANCE, THE TOUCH CONTROL IS DELICATE, AND THE RESPONSE IS QUICK, COOKING IS EASY.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 4;
-- 2024/04/Slide4-2.jpg
UPDATE product_image SET caption_md = '### STEAM DELICIOUS & FRESH

PROFESSIONAL STEAMING

STEAM SYSTEM 4.0: THROUGH-TYPE POWER DUAL STEAM, HIDDEN DUAL DIRECT INJECTION EVAPORATORS, STEAM FLOW NOZZLE LAYOUT, IMITATION BOILER-TYPE EVAPORATION

Fluid mechanics directly injects steam through the food: The fluid mechanics design nozzle layout enables the steam to surround the food evenly and penetrate the food;

Evaporation plate steam, surrounding steam quickly fills the cavity, and three-dimensional convection fully surrounds the food'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 5;
-- 2024/04/Slide5-2.jpg
UPDATE product_image SET caption_md = '### STEAM THREE-STAGE HUMIDITY

LOW

MEDIUM

HIGH

According to the temperature and humidity of different ingredients, retain the nutrients of the ingredients to reduce water loss, and steam out the original flavour of the ingredients.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 6;
-- 2024/04/Slide11-1.jpg
UPDATE product_image SET caption_md = '### 蒸烤同步

### STEAM GRILL & STEAM BAKE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 7;
-- 2024/04/Slide12-1.jpg
UPDATE product_image SET caption_md = '### STEAM GRILL

STEAM MOISTURIZING AND ROASTING, THE FOOD WILL BE CRISPY AND JUICY

TRADITIONAL OVEN, THE FOOD WILL BE DRY & TASTELESS'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 8;
-- 2024/04/Slide13-1.jpg
UPDATE product_image SET caption_md = '### STEAM GRILL FUNCTION WITH 3 HUMIDITY LEVEL CONTROL

High humidity roasting

Tender

Low humidity roasting

Slight Burning

Medium humidity roasting

Crispy'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 9;
-- 2024/04/Slide14.jpg
UPDATE product_image SET caption_md = '### Matching ingredients

High humidity roasting

Rib Roast

Medium humidity roasting

Roasting a Whole Chicken

Low humidity roasting

Roasting Vegetables'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 10;
-- 2024/04/Slide25.jpg
UPDATE product_image SET caption_md = '### 脂肪

### FAT

### 嘌呤

### PURINE

FIRE BURN AT BOTTOM MOST OF THE FAT IS ALSO DISSOLVED IN WATER.'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 11;
-- 2024/04/Slide27.jpg
UPDATE product_image SET caption_md = '### STEW MEAT

TRADITIONAL WAY OF COOKING MEAT NEED TO  CONSTANT CARE WHILE FLIP TO THE OTHER SIDE

Very Burn

CONVENTIONAL STEAMING MATTED WILL TURN OUT BLAND AND BORING

Bland

WITH THE MAGIC SERIES COMBI OVEN, YOU WILL HAVE A BETTER OUTCOME AS THE MEAT TURN OUT TO HAVE A WONDERFUL TEXTURE AND GOLDEN BROWN.

Golden Brown'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 12;
-- 2024/04/Slide31.jpg
UPDATE product_image SET caption_md = '### AUTO- CLEAN

HIGH TEMPERATURE SOFTENS OIL STAINS MAKING CLEANING EASIER'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 13;
-- 2024/04/Slide32.jpg
UPDATE product_image SET caption_md = '- Width: 595mm
- Height: 595mm
- Depth: 563mm
- Model No.: VA06
- Categroy: Steam & Combi Oven
- Frequency: 50 Hz
- Rating Voltage: 220 V
- Rating Power: 3000 W
- Capacity: 70 L
- Product Size: 595 x 595 x 563 mm
- Built-in Size: 560×595×≥550 mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 14;
-- 2024/04/Slide15.jpg
UPDATE product_image SET caption_md = '### STEAM BAKE

SOURDOUGH BY VATTI COMBI OVEN'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 15;
-- 2024/04/Slide16.jpg
UPDATE product_image SET caption_md = '### ADVANTAGE VATTI STEAM BAKE FUNCTION

- PRODUCES CRUST SHINE
- PRODUCES CRUST BRITTLENESS
- IMPROVES CRUST BLOOM
- IMPROVES BREAD SYMMETRY DURING OVENSPRING

STEAM

NO STEAM'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 16;
-- 2024/04/Slide17.jpg
UPDATE product_image SET caption_md = 'Regular Oven VS Steam Bake Oven

### BETTER RISE

### CRISPIER CRUST & BETTER COLOUR

Regular Oven VS Steam Bake Oven

Better Rise'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 17;
-- 2024/04/Slide18.jpg
UPDATE product_image SET caption_md = '### AIR-FRYER

HEALTHY COOK LESS FAT & LOWERS CALORIE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 18;
-- 2024/04/Slide19.jpg
UPDATE product_image SET caption_md = '### 2 MODE AIR-FRYER

ROOT CROPS MODE

MEAT MODE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 19;
-- 2024/04/Slide20.jpg
UPDATE product_image SET caption_md = '### STEW

INTELLIGENT STEWING CURVE, ONE-CLICK REPRODUCTION OF DELICIOUS SOUP'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 20;
-- 2024/04/Slide21.jpg
UPDATE product_image SET caption_md = '### 3 STEW MODE

STEW 1 PORRIDGE

STEW 2 SOUP

STEW 3 MEAT'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 21;
-- 2024/04/Slide22.jpg
UPDATE product_image SET caption_md = '### STEW FUNCTION

### 360-DEGREE HOT AIR + STEAM HEAT'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 22;
-- 2024/04/Slide23.jpg
UPDATE product_image SET caption_md = 'INTELLIGENT MATCHING OF TIME AND TEMPERATURE MAKES THE STEWED SOUP WITH TENDER MEAT AND WITH DEEP NUTRIENTS THAT MELT INTO THE SOUP, MAKING IT SWEET AND DELICIOUS.

160°C High heat boiling

130°C Simmer low boiling

Preheat with slow fire

Preheat with high fire

Preheat with low fire

Keep warm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 23;
-- 2024/04/Slide24.jpg
UPDATE product_image SET caption_md = '### STEW PORRIDGE

TRADITIONAL WAY OF COOKING MATTED COST IT TO BE DRY

Very Dry

CONVENTIONAL STEAMING MATTED DO NOT GIVE YOU THE SMOOTH TEXTURE

Dry

WITH THE MAGIC SERIES COMBI OVEN, YOU WILL HAVE A BETTER OUTCOME.

Just nice'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 24;
-- 2024/04/Slide26.jpg
UPDATE product_image SET caption_md = '### STEW SOUP

TRADITIONAL WAY OF COOKING MATTED COST THE MEAT TO BRAKE WHILE BOILING AND WILL COST THE SOUP TO BE OILY AND DRY UP FASTER.

Dry & Oily

CONVENTIONAL STEAMING MATTED DOES NOT COOK PROPERLY, IT MIGHT HAVE THE MEAT CENTRALLY RAW

Still Raw

WITH THE MAGIC SERIES COMBI OVEN, YOU WILL HAVE A BETTER OUTCOME AS THE SOUP IS LESS OILY AND COOK THE WAY THROUGH

Just nice & Less oil'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 25;
-- 2024/04/Slide28.jpg
UPDATE product_image SET caption_md = '### 68 CUSTOMIZED RECIPES

CONVENIENT AND RICH NEVER THE SAME EVERY DAY'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 26;
-- 2024/04/Slide29.jpg
UPDATE product_image SET caption_md = '### Defrost:

retain the nutrients of ingredients and cut frozen meat in one go

### Fermentation:

Fermented dough is more fluffy'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 27;
-- 2024/04/Slide30.jpg
UPDATE product_image SET caption_md = '### Warm:

60 degrees heat preservation, food can be stored and eaten at any time

### Yogurt:

homemade yogurt is delicious

### Rice:

Steam delicious rice with one click'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06') AND position = 28;

-- built-in-steam-oven-z4501 — 4 of 6 images carry text
-- 2023/02/BBB.gif
UPDATE product_image SET caption_md = '### 68 SMART PROFESSIONAL CHEF RECIPE

INTELIGENT MULTIPLE PORTION RECIPE AUTO ADJUST COOKING TIME & TEMPERATURE.

PROVIDE A MORE REFINED COOKING ENVIRONMENT FOR DIFFERENT TYPES OF PORTION RECIPE.

CHOICE

QUANTITY

INCH

GRAM

PRECISE PORTION GUIDANCE

TIME

TEMPERATURE

SET　INCH　GRAM'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-steam-oven-z4501') AND position = 2;
-- 2023/02/VA01-PRESENTATION-5.gif
UPDATE product_image SET caption_md = '### VATTI STEAM + GRILL COMBI FUNCTION

100 ℃– 230℃ GRILL + STEAM MORE TENDER & DELICIOUS'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-steam-oven-z4501') AND position = 3;
-- 2023/11/Built-in-Steam-Oven-Z4501-4.webp
UPDATE product_image SET caption_md = '### VATTI TOP & BOTTOM HEATING TAPE TECHNOLOGY

NO WATER DROPPING MAKES THE FOOD MORE DELICIOUS

### PERFORMANCE

VS

VATTI STEAMER WATER NO DROP SURFACE DRY

OTHER STEAMER WATER DROP SURFACE WET'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-steam-oven-z4501') AND position = 4;
-- 2023/11/Built-in-Steam-Oven-Z4501-8.webp
UPDATE product_image SET caption_md = '### BUILT IN STEAM OVEN Z4501

6 + 2 AUTO MENU

DUAL NOZZLE

42L BIG CAPACITY

ACCURATE TEMPERATURE'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'built-in-steam-oven-z4501') AND position = 5;

-- vatti-dishwasher-dwbb7 — 16 of 18 images carry text
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-1.webp
UPDATE product_image SET caption_md = '### The finest dishwasher around

Wash

Dry

Sterilise

Store'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 2;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-13.webp
UPDATE product_image SET caption_md = '### BLDC inverter motor

V-wash technology, varible speed and supercharged power'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 3;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-11.webp
UPDATE product_image SET caption_md = '### Zero residual

waste water & detergent'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 4;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-7.webp
UPDATE product_image SET caption_md = '### Triple disinfection technology

>99.99%

UV light Sterilizer

75°C

High-Temperature Wash'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 5;
-- 2024/08/Vatti_Dishwasher-09.png
UPDATE product_image SET caption_md = '### Innovative hybrid condensation dishwasher

- Condensing fan
- Mixed condensation duct
- Dehumidifier
- Condensing fan
- Filter air inlet duct
- Inlet fan
- Side wall air inlet duct'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 6;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-2.webp
UPDATE product_image SET caption_md = '### Automatic ventilation keeps storage for 7 days

99.99%

Bacteria removal rate

Automatic ventilation system refreshes the air and use UV light sterilizer to prevent bacteria keeping tableware fresh and longer'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 7;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-4.webp
UPDATE product_image SET caption_md = '### Smart intelligent wash

The infrared detector automatically assesses the level of dirt on the dishes and selects the appropriate washing mode.

Utility model patent: ZL201821252965.X

### Programs with multiple functions

Vegetable

Feeding Bottle

Toys'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 8;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-6.webp
UPDATE product_image SET caption_md = '### Easy to clean black crystal glass

Oil stains are easily removed

### All steel liner

Quick-drying and easy to clean Antibacterial rate >91%

### Self-cleaning

No more worries getting your hands dirty'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 9;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-14.webp
UPDATE product_image SET caption_md = '### 17 Capacity Dishwasher'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 10;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-12.webp
UPDATE product_image SET caption_md = 'A three-layer counter-rotating spray wash system capable of effectively cleaning'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 11;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-8.webp
UPDATE product_image SET caption_md = 'Ranked #1 in energy efficiency on the market, our dishwasher  offers exceptional power savings and eliminates the need for multiple washs

### Half load

top load or bottom load

saving water, electricity and time'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 12;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-10.webp
UPDATE product_image SET caption_md = '### 110°C independent drying

better then sterilizer box

110°C UVC

### 108mm extended PTC infrared ceramic heater

With high-speed fan, it can generate hot air up to 110°C'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 13;
-- 2024/08/Vatti_Dishwasher-10.png
UPDATE product_image SET caption_md = '### Double pumps drain without residual water & food

achieve true dryness

- Main pump
- Net discharge pump
- Large flow centrifugal pump'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 14;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-3.webp
UPDATE product_image SET caption_md = '### Human-Centered Design

Designed for ease of use and simplicity

7 core programs

5 additional programs

8 auto menus'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 15;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-5.webp
UPDATE product_image SET caption_md = '### Easy-cleaning filtration

- PP plastic net
- 304 stainless steel flow net
- 304 stainless steel flat filter'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 16;
-- 2024/08/Vatti-DWBB7-Dishwasher-product-description-9.webp
UPDATE product_image SET caption_md = '### Product parameters

- 775mm
- 598mm
- 570mm
- Product : Model: DWBB7
- Capacity : 17 sets
- Rated voltage : 220V - 240V
- Rated water 0.04-1.0MPa
- Rated power : 1900W
- Water efficiency level : Level 1
- Product size :(width x height x depth) 598×775×570mm
- Embedded size :(width x height x depth) 600×780×580mm'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7') AND position = 17;

-- vatti-one-tap-water-purifier-wdhg01-with-v818wd — 13 of 17 images carry text
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-1.png
UPDATE product_image SET caption_md = '### One Tap 2 in 1 water purifier and hot water

WDHG01 + V818WD'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 4;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-2.png
UPDATE product_image SET caption_md = '### Fast heating technology

Hot water comes out in 3 seconds

save time and no need to wait for hot water'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 5;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-3.png
UPDATE product_image SET caption_md = '### 600G big capacity Enjoy a glass of water in 6 seconds'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 6;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-4.png
UPDATE product_image SET caption_md = '### Patented 4 layer precision filtration

- 1st level filtering — PP Cotton Filter element
- 2nd level filtering — Pre Activated Carbon
- 3rd level filtering — RO Reverse Osmosis membrane
- 4th level filtering — Post Activated Carbon'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 7;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-5.png
UPDATE product_image SET caption_md = '### RO membrane filter

Filters out harmful bacteria, viruses, and minuscule microbes.

0.0001 Micron RO Membrance'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 8;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-6.png
UPDATE product_image SET caption_md = '### International Authorised certification

### Save and reliable brand'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 9;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-7.png
UPDATE product_image SET caption_md = '### Multi level water temperature

Convenience and efficiency in enhancing daily hydration'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 10;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-8.png
UPDATE product_image SET caption_md = '- 1st Mode — 100℃ Brewing tea
- 2nd Mode — 85℃ Brewing Coffee
- 3rd Mode — 45℃ Make Milk
- 4th Mode — Room Temperature'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 11;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-9.png
UPDATE product_image SET caption_md = '### Intelligent digital display

Four temperature levels of water
One touch select easy to use'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 12;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-11.png
UPDATE product_image SET caption_md = '### Patented Integrated water channel design

Integrated water circuit simplifies installation of pipelines and reduces the risk of water leakage'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 13;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-12.png
UPDATE product_image SET caption_md = '### Patented design self service replacement filter

1. Remove the top cover in the direction of the arrow
2. Adjust the cap handle in the direction arrow to unlock and take out
3. Lift the filter upwards and replace it'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 14;
-- 2025/01/12.png
UPDATE product_image SET caption_md = '- RO membrane filter 24 months RM499
- Four layer Carbon filter 12 months RM189

### Spend less money and drink better water'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 15;
-- 2025/01/One-Tap-water-purifier-WDHG01-Image-info-14.png
UPDATE product_image SET caption_md = '### Save space

Can be placed on the counter top  or hidden under the kitchen cabinet'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd') AND position = 16;
