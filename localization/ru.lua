return {
    descriptions = {
        Joker = {
			j_buf_abyssalp = {
				name = "Бездонная Призма",
				text = {"При {C:attention}получении{} этого джокера создаёт {C:buf_spc}Эхо{} и",
						"{C:attention}изгоняет{} всех остальных",
						"джокеров. Каждый 3-й ход один джокер становится",
						"{C:dark_edition}негативным{}. Продайте его, чтобы вернуть джокеров",
						"{C:inactive}(#2#/3 раунда. #1# негативный(ых) джокер(а)){}",
						"{C:inactive,s:0.7}Должно быть место{}"
				}
			},
			j_buf_abyssalecho = { -- Special (Abyssal Prism)
				name = "Эхо бездны",
				text = {"Даёт {C:mult}+#2#{} множ.",
						"за каждого джокера в",
						"{C:attention}Бездонной Призме{}",
						"{C:inactive}(сейчас:{} {C:mult}+#1#{} {C:inactive}множ.){}",
						"{C:inactive,s:0.6}Уничтожается если Призма удалена{}"
				},
				unlock = {"Получите",
						"{C:attention}Бездонную Призму{}",
				}
			},
			j_buf_afan = {
				name = "Преданный фанат",
				text = {"{C:mult}+#1#{} множ.",
						"Стоит {C:money}$6{}, чтобы быть {C:attention}проданным{}",
						"Шанс {C:green}#2# к #3#{} {C:attention}вернуться{}",
						"после {C:attention}продажи{}"}  
			},
			j_buf_afan_spc = {
				name = "Озлобленный экс-фанат",  -- Special (Adoring Fan)
				text = {"Переворачивает и тасует всех {C:attention}Джокеров{} или",
						"{C:attention}все игральные карты{} с каждой рукой (случайно)",
						-- Я не уверен в том, что означало "at random"
						"Стоит {C:money}$25{} чтобы быть проданным",
						"Через {C:attention}#1#{} раунда(ов), цена продажи становится положительной",
				},
				unlock = {"Разгадайте {E:1,C:buf_spc}особое{}",
						"требование",
						"{C:attention}Преданного фаната{}"
				}  
			},
			j_buf_argument = {
				name = "Уместный аргумент",
				text = {"Преобразует неразыгранную",
						"карту в одну из",
						"разыгранных, если",
						"{C:attention}сыгранная рука{} — это {C:attention}Две пары{}"
				}  
			},
			j_buf_cashout = {
				name = "Обналичивающий ваучер",
				text = {"Если {C:attention}выигрышная рука{} утраивает {C:attention}требование{} блайнда,",
					"заработайте 0.4% от него",
					"в виде {C:money}денег{} и уничтожьте этого джокера",
					"{C:inactive}(Максимум{} {C:money}$50{}{C:inactive}){}"
				}
			},
			j_buf_clays_alt = {
				name = "Стендовая стрельба",
				text = {"Получите {C:money}$#1#{} в",
						"конце раунда",
						"если вы выиграете ровно в",
						"{C:attention}#2#{} руку(руки)",
						"{C:inactive,s:0.7}Меняется каждый раунд{}"
				}
			},
			j_buf_clays = {
				name = "Стендовая стрельба",
				text = {"Получите {C:money}$#1#{} в",
						"конце раунда, если вы",
						"выиграете в указанном",
						"количестве рук",
						"{C:inactive,s:0.7}(Меняется каждый раунд){}"
				}
			},
			j_buf_clown = {
				name = "Клоун",
				text = {"Этот джокер получает {C:chips}+#1#{} фишек",
						"при добавлении другого джокера",
						"{C:inactive}(сейчас:{} {C:chips}+#2#{} {C:inactive}фишек){}",
						"{C:inactive,s:0.7}Джимбо = Фишки{}",
						"{C:buf_spc,s:0.7}Особенно любит свою компанию{}"
				}
			},
			j_buf_van_alt = {
				name = "Фургон", -- Special (Clown) [ALT]
				text = {"Этот джокер получает {C:chips}+#1#{} фишек",
						"при добавлении другого джокера",
						"{C:inactive}(сейчас:{} {C:chips}+#2#{} {C:inactive}фишек){}",
						"{C:inactive,s:0.7}Помещается очень много клоунов{}",
				}
			},
			j_buf_van = {
				name = "Фургон", -- Special (Clown)
				text = {"Этот джокер получает {C:chips}фишки{}",
						"при добавлении другого джокера",
						"Количество фишек зависит от того,",
						"сколько в фургоне {C:attention}клоунов{}",
				},
				unlock = {"Разгадайте {E:1,C:buf_spc}особое{}",
						"требование",
						"{C:attention}Клоуна{}"
				}  
			},
			j_buf_denial = {
				name = "Арстотцкое отрицание",
				text = {"{C:mult}+5{} Множ. или {C:chips}+30{} фишек",
						"за каждую {C:red}Красную{} или {C:blue}Синюю{} печать",
						"в полной колоде {C:attention}соответственно{}",
						"{C:inactive}(сейчас:{} {C:mult}+#1#{} {C:inactive}множ. /{} {C:chips}+#2#{} {C:inactive}фишек){}",
						}
			},
			j_buf_dorkshire = {
				name = "Доркширский чай",
				text = {"Все {C:attention}2{}, {C:attention}3{} и {C:attention}10{} становятся",
						"{C:attention}Фарфоровыми картами{} перед",
						"подсчетом очков, если {C:attention}сыгранная рука{} — {C:attention}Сет{}"
						}
			},
			j_buf_dorkshire_alt = {
				name = "Доркширский чай",
				text = {"{C:attention}2{}, {C:attention}3{}, {C:attention}10{}, {C:attention}12{}, {C:attention}13{}, {C:attention}21{} и {C:attention}25{}",
						"становятся {C:attention}Фарфоровыми картами{} перед",
						"подсчетом очков, если {C:attention}сыгранная рука{} — {C:attention}Сет{}"
						}
			},
			j_buf_dorkshire_g = {
				name = "Доркширское золото",
				text = {"Все {C:attention}2{}, {C:attention}3{} и {C:attention}10{} становятся",
						"{C:buf_spc}Королевскими фарфоровыми картами{} перед",
						"подсчетом очков, если сыгранная рука",
						"— {C:attention}Сет{}"
						},
				unlock = {"Начните забег",
						"с {C:attention}Фарфоровой колодой",
						"и {C:attention}Фарфоровым протектором"
				}
			},
			j_buf_dorkshire_g_alt = {
				name = "Доркширское золото",
				text = {"{C:attention}2{}, {C:attention}3{}, {C:attention}10{}, {C:attention}12{}, {C:attention}13{}, {C:attention}21{} и {C:attention}25{}",
						"становятся {C:buf_spc}Королевскими фарфоровыми картами{} перед",
						"подсчетом очков, если сыгранная рука",
						"— {C:attention}Сет{}"
						},
				unlock = {"Начните забег",
						"с {C:attention}Фарфоровой колодой",
						"и {C:attention}Фарфоровым протектором"
				}
			},
			j_buf_fivefingers = {
				name = "Пять пальцев",
				text = {"{X:mult,C:white}X#1#{} Множитель, если у вас",
						"количество джокеров",
						"кратно {C:attention}5{}",
						"и разыгранная рука",
						"содержит ровно {C:attention}5 карт{}"
				}
			},
			j_buf_gfondue = {
				name = "Золотое фондю",
				text = {"Получите {C:money}#1#${} за",
						"{C:attention}первую руку{}",
						"раунда, {C:money}-#2#${} за",
						"сыгранный раунд",
				}
			},
			j_buf_camarosa = {
				name = "Камароса",
				text = {"{X:expmult,C:white}^#1#{} множ.",
						"Шанс {C:green}#2# к #3#{}, что эта",
						"карта будет уничтожена",
						"в конце раунда",
				}
			},
			j_buf_kerman = {
				name = "Джебедайя Керман",
				text = {"Получает {C:mult}+#2#{} множ. каждый раз,",
						"когда используется любая {C:planet}Планета{}",
						"Шанс {C:green}#4# к #3#{} {C:attention}ВЗОРВАТЬСЯ{} при использовании",
						"{C:inactive}(сейчас:{} {C:mult}+#1#{} {C:inactive}множ.){}"
				}
			},
			j_buf_kerman_spc = { -- Special (Jebediah Kerman)
				name = "Перерождение Джебедайя",
				text = {"Получает {C:mult}+#2#{} множ. каждый раз,",
						"когда используется любая {C:planet}Планета{}",
						"{C:spectral}Чёрные дыры{} дают {C:attention}#3#%{} текущего множ.",
						"{C:inactive}(сейчас:{} {C:mult}+#1#{} {C:inactive}множ.){}"
				},
				unlock = {"Разгадайте {E:1,C:buf_spc}особое{}",
						"требование",
						"{C:attention}Джебедайя Кермана"
				}  
			},
			j_buf_jokergebra = {
				name = "ДжокерГебра",
				text = {"Даёт {C:attention}x5{} от",
						"{C:mult}множ.{} от джокеров,",
						"{C:attention}левее{} этого в качестве {C:chips}фишек{}",
						"{C:buf_spc,s:0.7}#1# XМнож!{}"
				}
			},
			j_buf_integral = { -- Special (JokerGebra)
				name = "Интеграл",
				text = {"Даёт {X:expchips,C:white}^0.02{} фишек",
						"за каждый {X:mult,C:white}X1{} множ.",
						"применённый до этого джокера",
						"за руку",
				},
				unlock = {"Разгадайте {E:1,C:buf_spc}особое{}",
						"требование",
						"{C:attention}ДжокерГебры"
				}  
			},
			j_buf_korny = {
				name = "Кукурузный джокер",
				text = {"{C:chips}+#1#{}, {C:chips}+#2#{} и {C:chips}+#3#{} фишек",
						"во время {C:attention}Малого блайнда{}, {C:attention}Большого блайнда{} и",
						"{C:attention}Босс-блайнда{} соответственно. {C:green}Неизвестный{}",
						"шанс умереть в конце раунда",
						"{C:inactive,s:0.7}Вы не знаете шансы...{}"
				}
			},
			j_buf_laidback = { 
				name = "Неторопливый джокер",
				text = {
					"{X:mult,C:white}X#1#{} множ.",
					"Занимает 2 слота",
				},
			},
			j_buf_lemmesolo = { 
				name = "Да я её одной левой",
				text = {
					"{C:mult}+#1#{} множ., {C:mult}ослабляется{} если есть",
					"другие джокеры",
					"Когда {C:attention}Босс-блайнд{} побеждён,",
					"создаёт #2# случайных джокера, среди них",
					"не менее #3# {C:mult}редких{}",
					"Уничтожается после срабатывания эффекта"
				},
			},
			j_buf_maggit = { 
				name = "Опарыш",
				text = {
					"{X:expmult,C:white}^#1#{} множ., если у вас есть",
					"{C:dark_edition}Ню-метал{} джокер. В противном случае,",
					"{C:attention}только один раз{} создайте его",
					"при выборе {C:attention}Блайнда{}",
					"{C:inactive,s:0.7}(Должно быть место){}",
					-- Я без понятия, как работает создания ню-метал джокеров,
					-- Попробую найти в исходниках реализацию этого эффекта
				},
			},
			j_buf_maggit_alt = { 
				name = "Опарыш",
				text = {
					"{X:expmult,C:white}^#1#{} множ., если у вас есть",
					"{C:dark_edition}Ню-метал{} джокер. В противном случае,",
					"{C:attention}только один раз{} создайте его",
					"при выборе {C:attention}Блайнда{}",
					"{C:inactive,s:0.7}(Уже создан){}",
				},
			},
			j_buf_memcard = {
				name = "Карта памяти",
				text = {"Запоминает {C:attention}первую{} разыгранную карту в каждом {C:attention}раунде{}",  
						"до {C:attention}8{} раз. Продайте, чтобы преобразовать карту в",
						"руке в каждую запомненную карту {C:attention}по порядку{}",
						"{C:inactive}Запомнено #1#. Последняя: #3#{}{C:inactive}#2#{}",
						}
			},
			j_buf_dxmemcard = {
				name = "Deluxe карта памяти",
				text = {"Запоминает {C:attention}первую{} засчитанную карту в каждой {C:buf_spc}руке{}",  
						"до {C:buf_spc}16{} раз. Продайте, чтобы преобразовать карту в",
						"руке в каждую запомненную карту, {C:attention}по порядку{}",
						"{C:inactive}Запомнено #1#. Последняя: #3#{}{C:inactive}#2#{}",
						},
				unlock = {"Начните забег",
						"с {C:attention}ДжимбоСтейшн колодой",
						"и {C:attention}ДжимбоСтейшн протектором"
				}
			},
			j_buf_patronizing = {
				name = "Покровительствующий джокер",
				text = {"{X:chips,C:white}X#1#{} Фишек",
						"{C:attention}Принудительно{} выбирает 5 карт",
						"{C:buf_spc,s:0.7}Хочет, чтобы ты сыграл #2#{}"
				}
			},
			j_buf_supportive = { -- Special (Patronizing Joker)
				name = "Поддерживающий джокер", 
				text = {"{X:chips,C:white}X#1#{} фишек",
						"Подсказывает о",
						"3 последних картах в колоде",
						"в течение раунда"
				},
				unlock = {"Разгадайте {E:1,C:buf_spc}особое{}",
						"требование",
						"{C:attention}Покровительствующего джокера"
				} 
			},
			j_buf_supportive_alt = { -- Special (Patronizing Joker)[ALT]
				name = "Поддерживающий джокер", 
				text = {"{X:chips,C:white}X#7#{} Фишек",
						"{s:0.8}#1##4#{}",
						"{s:0.8}#2##5#{}",
						"{s:0.8}#3##6#{}",
				}
			},
			j_buf_porcelainj = {
				name = "Фарфоровый джокер",
				text = {"Дает {X:chips,C:white}X#2#{} фишек",
						"за каждые {C:attention}3 фарфоровые карты{}",
						"в вашей {C:attention}полной колоде{}",
						"{C:inactive}(сейчас:{} {X:chips,C:white}X#1#{} {C:inactive}фишек){}"
				}
			},
			j_buf_rerollin = {
				name = "Переброска",
				text = {"Получите {C:money}$#1#{} за",          
						"пятый {C:green}переброс{}",
						"один раз за магазин",
						"{C:inactive}({}{C:green}#3#{}{C:inactive} перебросов осталось){}"}
			},
			j_buf_roulette = {
				name = "Русская рулетка",
				text = {"Когда выбран {C:attention}Блайнд{}, получите {C:money}$#3#{}",          
						"Шанс {C:green}#1# к #2#{}, что вы {E:1,C:mult}проиграете игру{}",
						"Если шанс достигает {C:green}1 к 2{} и вы выиграете,",
						"создаёт случайного {C:legendary}Легендарного{} джокера",
						"{C:inactive,s:0.7}(Шанс и выплата увеличивается с каждым раундом)"
				}
			},
			j_buf_sayajimbo = {
				name = "Сайаджимбо",
				text = {"{C:chips}+#1#{} фишек",
						"Наберите не менее {C:attention}#2#{} фишек за одну",
						"руку чтобы {C:attention}трансформироваться{}",
						"{C:inactive}(Следующий уровень: {C:mult}+20{C:inactive} Множ.)",
				}
			},
			j_buf_sayajimbo_s1 = {
				name = "Супер Сайаджимбо",
				text = {"{C:mult}+#1#{} Множ.",
						"Наберите не менее {C:attention}#6#{} фишек за одну",
						"руку #5# раз чтобы {C:attention}трансформироваться{}",
						"{C:inactive}(#4#/#5#, Следующий уровень: {X:mult,C:white}X3{C:inactive} Множ.)",
				}
			},
			j_buf_sayajimbo_s2 = {
				name = "Супер Сайаджимбоo 2",
				text = {"{X:mult,C:white}X#2#{} Множ.",
						"Наберите не менее {C:attention}#6#{} фишек за одну",
						"руку #5# раз чтобы {C:attention}трансформироваться{}",
						"{C:inactive}(#4#/#5#, Следующий уровень: {X:expmult,C:white}^1.3{C:inactive} Множ.)",
				}
			},
			j_buf_sayajimbo_s3 = {
				name = "Супер Сайаджимбо 3",
				text = {"{X:expmult,C:white}^#3#{} Множ.",
						"{C:inactive}Лицезрите!"
				}
			},
			j_buf_tailored = {
				name = "Пошитый костюм",
				text = {"Даёт {X:mult,C:white}X#1#{} множ., умноженный на",
						"процент карт",
						"{C:attention}преобладающей масти{} в вашей {C:attention}полной колоде{}",
						"{C:inactive}(Сейчас: #3#,{} {X:mult,C:white}X#2#{} {C:inactive}Множ.){}",
				}
			},
			j_buf_whitepony = {
				name = "Белый пони",
				text = {"{C:mult}+#1#{} множ.",
						"Удваивается",
						"с каждым {C:attention}Анте{}"
				}
			},
			j_buf_blackstallion = {
				name = "Чёрный жеребец",
				text = {"{C:mult}+#1#{} множ.",
						"Удваивается",
						"с каждым {C:attention}Анте{}"
				},
				unlock = {"Начните забег",
						"с {C:attention}Галопирующей колодой"
				}
			},
        },
        Back = {
			b_buf_jstation = {
				name = "Колода ДжимбоСтейшн",
				text = {"Начните забег с",
						"{C:red,T:j_buf_memcard} Картой памяти{}",
						"{C:attention}+1{} размер руки"
				}
			},
			b_buf_galloping = {
				name = "Галопирующая колода",
				text = {"Начните забег с",
						"{C:buf_spc,T:j_buf_blackstallion}Чёрным жеребцом{}",
				},
				unlock = {"Достигните анте",
						  "{C:attention}10"
				}
			},
			b_buf_porcelain = {
				name = "Фарфоровая колода",
				text = {"Начните забег с",
						"{C:red}Доркширским чаем{}",
						"и без 1 {C:attention}Масти{} в колоде",
				}
			},
			b_buf_sandstone = {
				name = "Песчаная колода",
				text = {"Победный анте - {C:attention}6-ой{}",
						"{C:red}X2{} базового размера анте"
				}
			},
        },
        Tarot = {
			c_buf_nobility = {
				name = "Благородство",
				text = {
					"Превращает {C:attention}#1#{} выбранную карту",
					"в {C:attention}Фарфоровую карту{}",
					"или в {C:attention}Королевскую фарфоровую карту{}",
					"если у вас есть хотя бы {C:money}$#2#{}"
				}
			},
        },
        Stake = {
			stake_buf_palladium = {
                name = 'Палладиевая ставка',
                text = {
                    '{C:attention}Финальный{} Босс-блайнд',
                    'появляется в {C:attention}два раза{} чаще',
					'{s:0.8}Применяет все предыдущие ставки'
                }
            },
			stake_buf_spinel = {
                name = 'Шпинелевая ставка',
                text = {
                    'Требуется на {C:attention}50% больше',
					'{C:attention}Анте{} для победы',
					'{s:0.8}Применяет все предыдущие ставки'
                }
            },
        },
        Other = {
			-------- STICKERS --------
			buf_palladium_sticker = {
                name = 'Палладиевый стикер',
                text={
                    "Этот джокер использовался",
                    "для выигрыша на сложности {C:attention}палладиевой",
                    "{C:attention}ставки{}",
                },
            },
			buf_spinel_sticker = {
                name = 'Шпинелевый стикер',
                text={
                    "Этот джокер использовался",
                    "для выигрыша на сложности {C:attention}шпинелевой",
                    "{C:attention}ставки{}",
                },
            },
		-------- ИНФОРМАЦИОННАЯ ОЧЕРЕДЬ --------
            korny_info = {
                name = "Авторство",
                text = {
                    "Оригинальный арт",
                    "от {C:green}Snakey{}",
                }
            },
			maggit_info = {
				name = "Ню-метал джокеры",
				text = {
					"Клоун, Пять пальцев",
					"Кукурузный джокер, Переброска'",
					"и Белый пони"
				}
			},
			special_info = {
				name = "Особый джокер",
				text = {
					"Обычно недоступен",
					"Выдаётся при {E:1,C:buf_spc}особых{}",
					"условиях"
				}
			},
			banish_info = {
				name = "Изгнание",
				text = {
					"Изгнанные джокеры",
					"{C:attention}временно{} уничтожены,",
					"сохраняют свои улучшения",
					"{C:attention}Вечные{} джокеры могут быть изгнаны"
				}
			},
			porc_info = {
				name = "Фарфоровая карта",
				text = {
						"{X:chips,C:white}X1.75{} Фишек",
						"Уничтожается, если сыгранная",
						"рука содержит больше", 
						"чем {C:attention}3{} карты",
				}
			},
			porcg_info = {
				name = "Королевский фарфор",
				text = {
						"{X:chips,C:white}X2{} Фишек, является картой с {C:attention}лицом{}",
						"Уничтожается, если сыгранная",
						"рука содержит больше", 
						"чем {C:attention}3{} карты",
				}
			},
        },
        Sleeve = {
			sleeve_buf_jstation = {
				name = "Протектор ДжимбоСтейшн",
				text = {"Начните забег с",
						"{C:red,T:j_buf_memcard}Картой памяти{}",
						"{C:attention}+1{} размер руки"
				}
			},
			sleeve_buf_jstation_alt = {
				name = "Протектор ДжимбоСтейшн",
				text = {"Начните забег с",
						"{C:buf_spc,T:j_buf_dxmemcard}Картой памяти{}",
						"{C:attention}+1{} размер руки"
				}
			},
			sleeve_buf_galloping = {
				name = "Галопирующий протектор",
				text = {"Начните забег с",
						"{C:buf_spc,T:j_buf_blackstallion}Чёрным жеребцом{}",
				}
			},
			sleeve_buf_galloping_alt = {
				name = "Галопирующий протектор",
				text = {"Вы начинаете с",
						"{C:green,T:j_buf_whitepony}Белым пони{}",
						"{C:blue}-2{} руки"
				}
			},
			sleeve_buf_porcelain = {
				name = "Фарфоровый протектор",
				text = {"Начните забег с",
						"{C:red,T:j_buf_dorkshire}Доркширским чаем{}",
						"и без 1 {C:attention}Масти{} в колоде",
				}
			},
			sleeve_buf_porcelain_alt = {
				name = "Фарфоровый протектор",
				text = {"Начните забег с",
						"{C:buf_spc,T:j_buf_dorkshire_g}Доркширским золотом{}",
						"и без 1 {C:attention}Масти{} в колоде",
				}
			},
			sleeve_buf_sandstone = {
				name = "Песчаный протектор",
				text = {"Победный анте - {C:attention}6-ой{}",
						"Базовый размер блайнда увеличен {C:red}в два раза{}"
				}
			},
			sleeve_buf_sandstone_alt = {
				name = "Песчаный протектор",
				text = {"Победный анте - {C:attention}5-ый{}",
						"Базовый размер блайнда увеличен {C:red}в три раза{}"
				}
			},
        },
		Enhanced = {
			m_buf_porcelain = {
				name = "Фарфоровая карта",
				text = {"{X:chips,C:white}X#1#{} Фишек",
						"Уничтожается, если сыгранная",
						"рука содержит больше", 
						"чем {C:attention}#2#{} карты",
				}
			},
			m_buf_porcelain_g = {
				name = "Королевская фарфоровая карта",
				text = {"{X:chips,C:white}X#1#{} Фишек, является картой {C:attention}с лицом{}",
						"Уничтожается, если сыгранная",
						"рука содержит больше", 
						"чем {C:attention}#2#{} карты",
				}
			},
		},
    },
    misc = {
		dictionary = {
			-------- КОНФИГУРАЦИЯ --------
			buf_cf_info_info = {
				"Точнее: аннотации авторства, аннотации",
				"особой редкости и аннотации механики изгнания",
				"Требуется перезапуск",
			},
			buf_cf_req_restart = {
				"3 джокера и 1 улучшение",
				"Требуется перезапуск",
			},
			buf_cf_show_spc = "Показывать особые карты в коллекции",
			buf_cf_show_info = "Показывать аннотации информационной очереди",
			-- Честно, я не знаю как перевести info queue на русский
			-- По идее это термин, так как очередь - особый тип объекта на равне с массивами

			-------- CREDITS --------
			buf_cr_artcode = "Арт и код",
			buf_cr_localization = "Перевод",
			buf_cr_sfx = "Звуковые эффекты",
			buf_cr_misc = "Прочее",
			-------- CARD MESSAGES --------
			buf_korny_ok = "В порядке!",
			buf_korny_dd = "Мёртв!",
			buf_prism_eor1 = "Мучение...",
			buf_prism_eor2 = "+1 Негативный!",
			buf_prism_sck = "Прочь!",
			buf_memory = "Запомнил!",
			buf_memfull = "Память переполнена!",
			buf_doubled = "Удвоено!",
			buf_convert = "Конвертировано!",
			buf_blowup = "Б У М !",
			buf_ydead = "Ты мёртв...",
			buf_dry = "Холостой!",		
			buf_afan_annoy1 = "Но, но...",
			buf_afan_annoy2 = "Оу...",
			buf_afan_annoy3 = "Ты уверен?",
			buf_afan_annoy4 = "Пожалуйста, не надо!",
			buf_afan_monologue1 = "Я БЫЛ твоим фанатом!",
			buf_afan_monologue2 = "Я обожал тебя!",
			buf_afan_monologue3 = "Ты БЫЛ моим героем!",
			buf_tea = "Чай!",
			buf_gfondue_licked = "Облизано!", -- Чего...
			buf_hit = "Удар!",
			buf_miss = "Промах!",
			buf_krakened = "Я переродился!",
			buf_supergrade = "ОГРОМНОЕ улучшение!",
			buf_disilluison = "Разачарован!",
			buf_defeated = "Повержен!",
			buf_hopin = "Запрыгивай!",
			buf_patspc = "Хорошо сыграно!",
			-------- MEMCARD STUFF --------
			buf_ready = "Готов",
			buf_Ace = "Туз",
			buf_Jack = "Валет",
			buf_Queen = "Дама",
			buf_King = "Король",
			-- UnStable compat --
			buf_0 = "0",
			['buf_0.5'] = "Половина",
			buf_1 = "1",
			buf_r2 = "Корень из 2",
			buf_e = "e",
			buf_Pi  = "Пи",
			buf_11 = "11",
			buf_12 = "12",
			buf_13 = "13",
			buf_21 = "21",
			buf_25 = "25",
			buf_161 = "161",
			["buf_???"] = "???",
			--------------------
			buf_of = " ",
			buf_Spades = "Пик",
			buf_Hearts = "Червей",
			buf_Clubs = "Треф",
			buf_Diamonds = "Бубен",
			-- Bunco/Paperback compat --
			buf_Fleurons = "Флерон",
			buf_Halberds = "Алебард",
			buf_Crowns = "Корон",
			buf_Stars = "Звёзд",
			-------- MISC --------
			k_buf_spc = "Особый",
			k_buf_notyet = "(Должно быть место)",
			buf_uniform = "Униформа",
		},
		v_dictionary = {
			a_buf_emult = "^#1# Множ.",
			a_buf_xchips = "X#1# Фишек",
			a_buf_echips = "^#1# Фишек",
		},
    },
}
