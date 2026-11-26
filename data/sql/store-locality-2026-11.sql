-- Store locality (2026-11-26): the town or neighbourhood and the state of each
-- dealer, for the store page title, description, eyebrow, LocalBusiness
-- address and the "other dealers nearby" list. Hand-set from each address,
-- not parsed at build: several addresses give only the state after the
-- postcode (Cheras, Semenyih, Subang Jaya), one gives a postcode for a
-- different town than its label suggests (32000 is Sitiawan, not Ipoh), and
-- shoppers search by neighbourhood (Kepong, Puchong, Johor Jaya) rather than
-- by the postal town. `locality` is the most specific name a shopper would
-- type, with the larger town after a comma where the neighbourhood alone is
-- ambiguous. `postcode` is read from the address (five digits).
--
-- Why: Search Console shows store pages earning impressions on dealer and
-- town searches at low CTR (SK Hardware Kuching 2,226 impressions / 6
-- clicks, Alat Dapur Shah Alam 1,734 / 3, Alatdapur Semenyih 1,025 / 0),
-- with every title and description naming only the region ("Klang Valley
-- Malaysia"), and 12 of 79 pages not indexed.

UPDATE store SET locality = 'Puncak Alam', state = 'Selangor', postcode = '42300' WHERE slug = 'alat-dapur-puncak-alam';
UPDATE store SET locality = 'Shah Alam', state = 'Selangor', postcode = '40460' WHERE slug = 'alat-dapur-shah-alam';
UPDATE store SET locality = 'Cheras', state = 'Selangor', postcode = '43200' WHERE slug = 'alatdapur-cheras';
UPDATE store SET locality = 'Semenyih', state = 'Selangor', postcode = '43500' WHERE slug = 'alatdapur-semenyih';
UPDATE store SET locality = 'Taman Tun Dr Ismail', state = 'Kuala Lumpur', postcode = '60000' WHERE slug = 'klang-valley-benova-marketing-sdn-bhd';
UPDATE store SET locality = 'Klang', state = 'Selangor', postcode = '41300' WHERE slug = 'klang-valley-de-bathlabz-batu-tiga-sdn-bhd';
UPDATE store SET locality = 'Bandar Bukit Tinggi, Klang', state = 'Selangor', postcode = '41200' WHERE slug = 'klang-valley-de-bathlabz-sdn-bhd';
UPDATE store SET locality = 'Cheras', state = 'Kuala Lumpur', postcode = '56000' WHERE slug = 'klang-valley-esh-electrical-sdn-bhd-ekocheras';
UPDATE store SET locality = 'Kepong', state = 'Kuala Lumpur', postcode = '52100' WHERE slug = 'klang-valley-esh-electrical-sdn-bhd-metro-prima';
UPDATE store SET locality = 'Damansara Utama, Petaling Jaya', state = 'Selangor', postcode = '47400' WHERE slug = 'klang-valley-esh-electrical-sdn-bhd-the-starling';
UPDATE store SET locality = 'SS2, Petaling Jaya', state = 'Selangor', postcode = '47300' WHERE slug = 'klang-valley-esh-electrical-sdn-bhd-petaling-jaya';
UPDATE store SET locality = 'Jalan Ipoh', state = 'Kuala Lumpur', postcode = '51200' WHERE slug = 'klang-valley-eurotan-enterprise-sdn-bhd';
UPDATE store SET locality = 'Bandar Sri Damansara', state = 'Kuala Lumpur', postcode = '52200' WHERE slug = 'klang-valley-eurotan-enterprise-sdn-bhd-2';
UPDATE store SET locality = 'Puchong', state = 'Selangor', postcode = '47100' WHERE slug = 'filken-puchong';
UPDATE store SET locality = 'Setapak', state = 'Kuala Lumpur', postcode = '53300' WHERE slug = 'harmoni-bath-kitchen-setapak';
UPDATE store SET locality = 'Subang Jaya', state = 'Selangor', postcode = '47620' WHERE slug = 'klang-valley-jf-home-appliances-sdn-bhd';
UPDATE store SET locality = 'Batu Caves', state = 'Selangor', postcode = '68100' WHERE slug = 'klang-valley-jw-sanitary-home-sdn-bhd';
UPDATE store SET locality = 'SS2, Petaling Jaya', state = 'Selangor', postcode = '47300' WHERE slug = 'kbo-kuche-bath-outlet-ss2';
UPDATE store SET locality = 'Jinjang, Kepong', state = 'Kuala Lumpur', postcode = '52000' WHERE slug = 'klang-valley-kbo-megastore-sdn-bhd-jinjang';
UPDATE store SET locality = 'Kuchai Lama', state = 'Kuala Lumpur', postcode = '58200' WHERE slug = 'kbo-megastore-sdn-bhd-kuchai-lama';
UPDATE store SET locality = 'Kinrara, Puchong', state = 'Selangor', postcode = '47180' WHERE slug = 'klang-valley-kbo-total-home-diy-sdn-bhd';
UPDATE store SET locality = 'Bandar Puteri, Puchong', state = 'Selangor', postcode = '47100' WHERE slug = 'kitchenwise-sdn-bhd';
UPDATE store SET locality = 'Pandan, Ampang', state = 'Kuala Lumpur', postcode = '55100' WHERE slug = 'klang-valley-living-portal-m-sdn-bhd';
UPDATE store SET locality = 'Kota Bayuemas, Klang', state = 'Selangor', postcode = '41200' WHERE slug = 'ltl-global-kota-bayuemas';
UPDATE store SET locality = 'Jalan Ipoh', state = 'Kuala Lumpur', postcode = '51200' WHERE slug = 'klang-valley-mandi-b-p-sdn-bhd';
UPDATE store SET locality = 'Bandar Sunway, Petaling Jaya', state = 'Selangor', postcode = '46150' WHERE slug = 'klang-valley-mum-kitch-bandar-sunway';
UPDATE store SET locality = 'Setia Alam, Shah Alam', state = 'Selangor', postcode = '40170' WHERE slug = 'perfect-electrical-setia-alam';
UPDATE store SET locality = 'USJ Taipan, Subang Jaya', state = 'Selangor', postcode = '47610' WHERE slug = 'perfect-electrical-usj-taipan';
UPDATE store SET locality = 'Klang', state = 'Selangor', postcode = '41200' WHERE slug = 'klang-valley-urbanez-sdn-bhd-klang';
UPDATE store SET locality = 'Kota Damansara, Petaling Jaya', state = 'Selangor', postcode = '47810' WHERE slug = 'klang-valley-urbanez-sdn-bhd-kota-damansara';
UPDATE store SET locality = 'Seri Kembangan', state = 'Selangor', postcode = '43300' WHERE slug = 'world-bath-kitchen-sdn-bhd';
UPDATE store SET locality = 'Damansara Damai, Petaling Jaya', state = 'Selangor', postcode = '47830' WHERE slug = 'klang-valley-xam-max-kitchen';
UPDATE store SET locality = 'Skudai', state = 'Johor', postcode = '81300' WHERE slug = 'southern-region-adamas-trading-m-sdn-bhd';
UPDATE store SET locality = 'Muar', state = 'Johor', postcode = '84000' WHERE slug = 'southern-region-darson-xtra-muar';
UPDATE store SET locality = 'Nusa Bestari, Johor Bahru', state = 'Johor', postcode = '81300' WHERE slug = 'southern-region-emart-nusa-bestari';
UPDATE store SET locality = 'Plentong, Masai', state = 'Johor', postcode = '81750' WHERE slug = 'southern-region-emart-plentong';
UPDATE store SET locality = 'Iskandar Puteri', state = 'Johor', postcode = '79150' WHERE slug = 'filken-bukit-indah';
UPDATE store SET locality = 'Kulai', state = 'Johor', postcode = '81000' WHERE slug = 'filken-kulai';
UPDATE store SET locality = 'Johor Jaya, Johor Bahru', state = 'Johor', postcode = '81100' WHERE slug = 'flo-plus-home-sdn-bhd';
UPDATE store SET locality = 'Setia Indah, Johor Bahru', state = 'Johor', postcode = '81100' WHERE slug = 'southern-region-grand-filken-setia-indah';
UPDATE store SET locality = 'Johor Jaya, Johor Bahru', state = 'Johor', postcode = '81100' WHERE slug = 'southern-region-home-care-kitchen-supply-sdn-bhd';
UPDATE store SET locality = 'Iskandar Puteri', state = 'Johor', postcode = '79100' WHERE slug = 'home-style-marketing-sdn-bhd';
UPDATE store SET locality = 'Bandar Jaya Putra, Johor Bahru', state = 'Johor', postcode = '81100' WHERE slug = 'homeworks-southern-sdn-bhd';
UPDATE store SET locality = 'Batu Pahat', state = 'Johor', postcode = '83000' WHERE slug = 'southern-region-homeworks-sdn-bhd';
UPDATE store SET locality = 'Segamat', state = 'Johor', postcode = '85000' WHERE slug = 'southern-region-kah-hoe-enterprise';
UPDATE store SET locality = 'Semabok, Melaka', state = 'Melaka', postcode = '75050' WHERE slug = 'southern-region-nikko-kitchen-amp-design-melaka';
UPDATE store SET locality = 'Muar', state = 'Johor', postcode = '84000' WHERE slug = 'southern-region-nikko-kitchen-amp-design-muar';
UPDATE store SET locality = 'Muar', state = 'Johor', postcode = '84000' WHERE slug = 'py-lighting-sdn-bhd';
UPDATE store SET locality = 'Johor Jaya, Johor Bahru', state = 'Johor', postcode = '81100' WHERE slug = 'southern-region-tanradio-johor-jaya';
UPDATE store SET locality = 'Batu Pahat', state = 'Johor', postcode = '83000' WHERE slug = 'tanradio-com-batu-pahat';
UPDATE store SET locality = 'Kulai', state = 'Johor', postcode = '81000' WHERE slug = 'southern-region-tanradio-com-kulai';
UPDATE store SET locality = 'Seri Alam, Masai', state = 'Johor', postcode = '81750' WHERE slug = 'southern-region-tanradio-com-seri-alam';
UPDATE store SET locality = 'Taman Ungku Tun Aminah, Skudai', state = 'Johor', postcode = '81300' WHERE slug = 'southern-region-tanradio-com-tun-aminah';
UPDATE store SET locality = 'Kluang', state = 'Johor', postcode = '86000' WHERE slug = 'southern-region-tanradio-com-electrical-sdn-bhd';
UPDATE store SET locality = 'Nilai', state = 'Negeri Sembilan', postcode = '27447' WHERE slug = 'southern-region-thye-hin-trading';
UPDATE store SET locality = 'Tebrau, Johor Bahru', state = 'Johor', postcode = '81100' WHERE slug = 'viva-nueva-sdn-bhd';
UPDATE store SET locality = 'George Town', state = 'Penang', postcode = '10400' WHERE slug = 'northern-region-ban-hin-bee-sdn-bhd-kitchentech';
UPDATE store SET locality = 'Sitiawan', state = 'Perak', postcode = '32000' WHERE slug = 'northern-region-felicita-homes-deco';
UPDATE store SET locality = 'Mergong, Alor Setar', state = 'Kedah', postcode = '05150' WHERE slug = 'northern-region-heng-foong-sanitaryware-trading';
UPDATE store SET locality = 'Simpang Kuala, Alor Setar', state = 'Kedah', postcode = '05400' WHERE slug = 'northern-region-hk-home-electrical-sdn-bhd';
UPDATE store SET locality = 'Bukit Mertajam', state = 'Penang', postcode = '14000' WHERE slug = 'sin-jin-da-hardware-sdn-bhd';
UPDATE store SET locality = 'Ipoh', state = 'Perak', postcode = '30250' WHERE slug = 'tahol-marketing';
UPDATE store SET locality = 'Kota Bharu', state = 'Kelantan', postcode = '15200' WHERE slug = 'east-coast-eastone-gallery-amp-marketing';
UPDATE store SET locality = 'Tunjung, Kota Bharu', state = 'Kelantan', postcode = '16010' WHERE slug = 'eastone-gallery-sdn-bhd-tunjung';
UPDATE store SET locality = 'Kuantan', state = 'Pahang', postcode = '25300' WHERE slug = 'east-coast-multi-skill-kitchen-design-sdn-bhd';
UPDATE store SET locality = 'Kuala Terengganu', state = 'Terengganu', postcode = '20200' WHERE slug = 'east-coast-union-motors-amp-electrical-supplies-sdn-bhd';
UPDATE store SET locality = 'Kuala Terengganu', state = 'Terengganu', postcode = '20200' WHERE slug = 'east-coast-union-motors-amp-electrical-supplies-sdn-bhd-2';
UPDATE store SET locality = 'Chukai, Kemaman', state = 'Terengganu', postcode = '24000' WHERE slug = 'east-coast-wpc-ideas-enterprise';
UPDATE store SET locality = 'Miri', state = 'Sarawak', postcode = '98000' WHERE slug = '91-electrical-trading-miri';
UPDATE store SET locality = 'Sandakan', state = 'Sabah', postcode = '90000' WHERE slug = 'bright-scott-electrical-sdn-bhd-sandakan';
UPDATE store SET locality = 'Kota Kinabalu', state = 'Sabah', postcode = '88300' WHERE slug = 'emart-kompleks-karamunsing';
UPDATE store SET locality = 'Sibu', state = 'Sarawak', postcode = '96000' WHERE slug = 'sarawak_in-ceramics-sdn-bhd';
UPDATE store SET locality = 'Inanam, Kota Kinabalu', state = 'Sabah', postcode = '88450' WHERE slug = 'sabah-novo-bath-home-sdn-bhd';
UPDATE store SET locality = 'Bintulu', state = 'Sarawak', postcode = '97000' WHERE slug = 'sarawak-sk-hardware-bintulu';
UPDATE store SET locality = 'Kuching', state = 'Sarawak', postcode = '93250' WHERE slug = 'sarawak-sk-hardware-kuching-sdn-bhd';
UPDATE store SET locality = 'Miri', state = 'Sarawak', postcode = '98000' WHERE slug = 'sarawak-sk-lifestyles-miri-sdn-bhd';
UPDATE store SET locality = 'Kuching', state = 'Sarawak', postcode = '93250' WHERE slug = 'sarawak-standard-kitchen-sdn-bhd';
UPDATE store SET locality = 'Penampang', state = 'Sabah', postcode = '89500' WHERE slug = 'vintage-bath-kitchen';
UPDATE store SET locality = 'Tawau', state = 'Sabah', postcode = '91000' WHERE slug = 'sabah-tai-amp-tai-tawau-sdn-bhd';
