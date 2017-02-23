# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.find_or_create_by(
  name: 'Ottawa Jazz Festival',
  start_date: Date.parse('2017/06/20'),
  end_date: Date.parse('2017/07/02'),
  registration_start_date: Date.parse('2017/03/01'),
  registration_end_date: Date.parse('2017/06/20'),
  active: true
)

Setting.find_or_create_by(
  name: 'Minimum number of dates',
  value_type: 'integer',
  value: '4'
)

Setting.find_or_create_by(
  name: 'Minimum number of choices',
  value_type: 'integer',
  value: '1'
)

Setting.find_or_create_by(
  name: 'Maximum number of choices',
  value_type: 'integer',
  value: '4'
)

OpportunityApplicationStatus.find_or_create_by(name: 'Pending')
OpportunityApplicationStatus.find_or_create_by(name: 'Accepted')
OpportunityApplicationStatus.find_or_create_by(name: 'Denied')

opportunities = [
  {
    objective: '<p>To be a presence in the Main Jazz Office during the festival - mainly answering phone inquiries.</p>',
    visible: false,
    title: 'Office',
    duties_and_responsibilities: '<p>To answer calls in the main Jazz office during the festival. Answering questions regarding the Festival concerts and venues. Direct call to the appropriate person on site.</p>',
    qualifications_and_requirements: '<p>Must be personable, able to communicate clearly, preferably bilingual.</p>',
    shifts: '<p>Jazz Office Communications - Ottawa Jazz Festival Office 602 - 294 Albert Street</p><p>Shifts are daily 9:00 a.m. - 4 p.m.</p>'
  },
  {
    objective: '<p>To promote and sell merchandise</p>',
    visible: false,
    title: 'Souvenirs',
    duties_and_responsibilities: '<p>Selling performers’ CD’s and promotional materials, as well as Jazz Festival merchandise when available.</p><p>May be required to help set up the tables and lay out the merchandise for sale.</p>',
    qualifications_and_requirements: '<p>Must be friendly, efficient and reliable. Possess good money handling skills. Confident dealing with the general public – effective communication skills. Become familiar with the event line up (a program will be provided for referencing)</p>',
    shifts: '<p>Souvenirs</p><p>Shifts are 5:00 p.m. - 11:00 p.m. (approx.)</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To help with stage/seating set-up and maintain the venue</p>',
    visible: false,
    title: 'Rideau Centre',
    duties_and_responsibilities: '',
    qualifications_and_requirements: '',
    shifts: '<p>Nordstrom Court - Rideau Centre 50 Rideau St.</p><p>Shifts are TBD</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To work in the Hospitality trailer, answering phones and serving volunteers.</p>',
    visible: false,
    title: 'Park Hospitality & Communications',
    duties_and_responsibilities: '<p>Manage festival phone calls throughout the festival. Answer questions about the Festival and site. Manage lost and found items. Sell drinks, snacks to volunteers.</p>',
    qualifications_and_requirements: '<p>Pleasant phone manner, knowledge of all other venues, concerts going on during the festival. Able to direct patrons to various locations throughout the park or off-site, e.g. 4th Stage at the NAC.</p>',
    shifts: '<p>Park Hospitality & Communications Trailer Staff. </p><p>Shifts are:  weekdays  4:00pm to 7:00pm,  5:00pm to 8:00pm  and 7:00pm to 10:00pm</p><p>                  weekends  12:00pm to 3:00pm,  3:00pm to 6:00pm,  5:00pm to 8:00pm  and 7:00pm to 10:00pm</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To ensure only people who are in possession of a valid ticket to attend or participate in a show gain access to the event.</p>',
    visible: false,
    title: 'Box Office Transition',
    duties_and_responsibilities: '<p>Selling event tickets, festival passes, providing information on various events.</p>',
    qualifications_and_requirements: '<p>Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling - credit card/debit payments and computer experience is preferred. However, training for this will be provided.</p>',
    shifts: '<p>Box Office Transition - Main Gate at Confederation Park.</p><p>Shift - Daily 4:00 - 7:00 p.m.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To ensure only people who are in possession of a valid ticket to attend or participate in a show gain access to the event.</p>',
    visible: false,
    title: 'Brookstreet Hotel',
    duties_and_responsibilities: '<p>Selling tickets, checking festival passes and wristbands, providing information on various events.</p>',
    qualifications_and_requirements: '<p>Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). )Must be able to work in a fast-paced environment as well as deal with patrons in a professional manner.</p>',
    shifts: '<p>Brookstreet Hotel - 525 Leggett Drive</p><p>Shifts are 7:30 p.m. - 1:30 a.m. Fr. & Sat. nights, both weekends.</p>'
  },
  {
    objective: '<p>To provide transportation to performing artists in a safe, friendly and professional manner.</p>',
    visible: false,
    title: 'Transportation',
    duties_and_responsibilities: '<p>Transporting artists to and from the airport, hotels and event venues</p><p>  May be asked to transport gear etc.</p>',
    qualifications_and_requirements: '<p>A valid driver’s license</p><p>  A clean driving record</p><p>  Must be 25 years of age or over</p><p>  Punctual pick-up and drop-off times essential</p><p>  May be required to lift heavy instruments</p><p>  Suited to friendly, outgoing and responsible person</p><p>  Knowledge of the city and its history</p><p>  A high level of professionalism</p>',
    shifts: '<p>Transportation Driver - various shifts available anytime during the day (6:00 a.m. right through to 3:30 a.m.)</p>'
  },
  {
    objective: '<p>To ensure all levels of service are maximized to accommodate guests to the best of our abilities and ensure the park grounds are kept clean and safe for festival patrons.</p>',
    visible: true,
    title: 'Site',
    duties_and_responsibilities: '<p>Placing admission bands on patrons in a friendly and efficient manner and checking badges and wristbands.Keeping the festival grounds & tables tidy, this includes some garbage detail.</p>',
    qualifications_and_requirements: '<p>Friendly, energetic, efficient and reliable. Enjoy working with others. Be able to work in a fast-paced environment. Often requires you to stand on your feet for long periods of time. Confident dealing with the general public – effective communication skills. Clean, with comfortable footwear.</p>',
    shifts: '<p>Shift times are 8:00 p.m. - 11:30 p.m. (approx.) You are require to sign up for a minimum of FOUR shifts.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p><p>Site Personnel for Gates at various locations throughout Confederation Park and Marion Dewar Plaza. Scanner and Gate positions.</p>'
  },
  {
    objective: '<p>To create the Outside Site venue grounds so it is visually appealing, effective and safe for patrons, volunteers and performers.</p>',
    visible: true,
    title: 'Logistics',
    duties_and_responsibilities: '<p>Set up and deconstruct the Outside Site logistical settings</p><p>    Move tables, chairs, equipment</p><p>    Construct the site areas as required</p>',
    qualifications_and_requirements: '<p>Requires a great deal of lifting and carrying – must be comfortable with moving large and heavy objects</p><p>    Ability to commit to a full day of work before the festival</p><p>    Available the morning after the festival to deconstruct the site</p><p>    Prepared to take direction and follow instructions</p><p>    Enjoys working with others and is a great team player</p><p>    Comfortable and sturdy footwear needed - CSA approved recommended</p>',
    shifts: '<p>Logistics - Various Festival Locations</p>'
  },
  {
    objective: '<p>To prepare and serve food to the hundreds of volunteers at the Ottawa Jazz Festival</p>',
    visible: false,
    title: 'BBQ',
    duties_and_responsibilities: '<p>Food prep prior to starting bbq</p><p>    Some shopping for food, cutlery, etc...</p><p>    Make sure area is kept clean including bbq</p><p>    Able to handle money transactions</p>',
    qualifications_and_requirements: '<p>Must be friendly, efficient and reliable</p><p>    Possess good money handling skills</p><p>    Confident dealing with the general public – effective communication skills</p>',
    shifts: '<p>BBQ in Volunteer Village</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To ensure only those with a Gold Pass are permitted in the tent. Provide bar service within the tent. Provide patrons with information as required.</p>',
    visible: false,
    title: 'Gold Circle Tent',
    duties_and_responsibilities: '<p>Checking all passes and wristbands. Bar service is provided within the Gold Tent - this includes pouring beer from a keg cooler and/or pouring wine. As per Smartserve, ensuring that patrons are not over-served. Providing information on all other venues, concerts going on during the festival. Able to direct patrons to various locations throughout the park or off-site, e.g. 4th Stage at the NAC.</p>',
    qualifications_and_requirements: '<p>Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities. Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling preferred, Smartserve required.</p>',
    shifts: '<p>Gold Circle Tent - Gate and Bar Service</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>-</p>',
    visible: false,
    title: 'Algonquin',
    duties_and_responsibilities: '<p>Park Security</p>',
    qualifications_and_requirements: '',
    shifts: '<p>Algonquin Security Team</p>'
  },
  {
    objective: '<p>To ensure  a successful, smooth operating Jam Session each night throughout the Festival. To help create an atmosphere that is enjoyable for the musicians and the public.</p>',
    visible: false,
    title: 'Jamming @ Spin Kitchen',
    duties_and_responsibilities: '<p>Greet the public at the door,selling tickets, checking festival passes and wristbands. Respond to questions regarding the musicians playing at the Jam session as well as any questions regarding the festival - i.e., who\'s playing at various venues, etc. Maintain crowd control at the venue</p>',
    qualifications_and_requirements: '<p>Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities. Must be able to work in a fast-paced environment as well as deal with patrons in a professional manner.Scanner training may be required.</p>',
    shifts: '<p>Door staff & ticket sales at the late night jamming sessions Located at Spin Kitchen/Marriot Hotel 100 Kent St.</p><p>Shifts are (tentatively) 10:00 p.m. - 1:00 a.m.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To make sure the door is managed - on site at the NAC Studio, selling/scanning tickets for Studio performances, managing the Studio jazz queues and helping direct the general public to the locations / events they are seeking.</p>',
    visible: false,
    title: 'NAC Studio',
    duties_and_responsibilities: '<p>Be familiar with the NAC (e.g. location of washrooms, other performance spaces, ATM, elevator, NAC box office, etc.). Learn what other public performances are taking place in the NAC on the same evening, including the jazz festival NAC Studio series. (For private functions such as weddings, graduations, corporate events, etc., direct attendees to the NAC information kiosk downstairs in the main lobby). Be aware of what other jazz festival concerts are being presented on the same day in it\'s sister venue - NAC Backstage - as well as other venues, and where other jazz festival sites and services are located (e.g., festival box office, Laurier Avenue Canadian Music Stage). Ensure that people are directed to where they want to go, be it one of the Studio queues, somewhere else in the NAC, somewhere outside the building or to someone else in the NAC who can assist (e.g., Information). Assist NAC ushers as appropriate with, e.g., queue management, ensuring everyone has a valid ticket or pass, etc. Respond to questions from the public: aside from NAC-specific questions, you could be asked anything from, e.g. where are the paintings? where can I find something to eat?; where is Glenn Gould’s piano?-- deal with issues that may arise.</p>',
    qualifications_and_requirements: '<p>Must enjoy working with the public, be outgoing and adaptable. Volunteers must be comfortable managing very large crowds of enthused Jazz fans. So crowd management skills & diplomacy with people are absolutely necessary. Preference will be given to those with cash experience - an ability to use scanners QUICKLY and/or sell tickets & handle cash/credit cards.</p>',
    shifts: '<p>NAC Studio Series - Located inside the NAC off the main level. This year shifts will usually be 5:30 p.m. - 7:30 p.m.</p><p>However, on some nights we will have a second show at 9pm. On those nights shifts will be 5:30 p.m. - 9:30 p.m.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To scan tickets by phone to ensure they are valid before patrons receive the appropriate wristband.</p>',
    visible: false,
    title: 'Ticket Scanners',
    duties_and_responsibilities: '<p>Scanning tickets and passes at the gates in a friendly and efficient manner.</p><p>Checking ID’s and monitoring show entrances at various venues.</p><p>Resolving scanner/ticket issues. You are responsible for picking up and returning your phone to the admin trailer at the beginning and end of each shift.</p>',
    qualifications_and_requirements: '<p>Tech savvy - enough to be able to use a smart phone to scan tickets.</p><p>Phones are provided with the appropriate software.</p>',
    shifts: '<p>Ticket Scanners at various locations including Confederation Park, Marion Dewar Plaza and the NAC</p><p>Scanner shifts are 5:00 p.m. - 9:30 p.m. (approx.) Scanner Supervisor shifts are 4:45 p.m. - 11:30 p.m.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To ensure only people who are in possession of a valid ticket to attend or participate in a show gain access to the event.</p>',
    visible: false,
    title: 'Box Office Daytime',
    duties_and_responsibilities: '<p>Selling event tickets, festival passes, providing information on various events.</p>',
    qualifications_and_requirements: '<p>Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling -  credit card/debit payments and computer experience is preferred. However,  training for this will be provided.</p>',
    shifts: '<p>Box Office Daytime - Main Gate at Confederation Park.</p><p>Shift - Daily 12:00 - 4:00 p.m.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To ensure Platinum patrons enjoy a hospitable experience.</p>',
    visible: false,
    title: 'Platinum',
    duties_and_responsibilities: '<p>Set up and deconstruct lawn chairs in front of the main stage for patrons</p><p>    Construct the site areas as required</p><p>    Collect tickets from patrons</p><p>    Help clean up area at the end of the night</p>',
    qualifications_and_requirements: '<p>Friendly, energetic, efficient and reliable</p><p>    Enjoy working with others </p><p>    Be able to work in a fast-paced environment</p><p>    Often requires you to stand on your feet for long periods of time outdoors</p><p>    Confident dealing with the general public – effective communication skills</p>',
    shifts: '<p>Platinum Section - set-up, gate management</p><p>Shift times are (set-up crew) 4:15 p.m. - 10:00 p.m. or 5:00 p.m. - 11:30 p.m. (approx.)</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To ensure that only those people with the proper badges are permitted into the area.This position requires professionalism, and tact, with friendly yet watchful presence. Greet and verify media personnel & festival staff entering the designated Media Area.</p>',
    visible: false,
    title: 'Media Security',
    duties_and_responsibilities: '<p>Check badges of people entering this section. Greet and verify media personnel & festival staff entering the designated Media Area. Provide information to patrons/media as required. Keep area clean.</p>',
    qualifications_and_requirements: '<p>Volunteers in this area need to be pleasant, professional and observant. It requires standing or sitting by the entrance and also to be watchful: an interesting balance between friendly and strict. It is preferable to remember, as much as possible, the people who have already passed through the gate and not to ask for their badges each time. Jazz Festival staff also need to be recognized and not asked for ID (they wear walkie-talkies).  Minimum entry into the trailer or disturbance, as the people working in the media area are often working on a story or submitting photos and may have tight deadlines. No eating or drinking while on duty at the entrance. As you are dealing with the media you are required to carry yourself in a professional manner.</p>',
    shifts: '<p>Media Security/Greeter - at entrance to Media Section.</p><p>Shifts are 5:00 p.m. - 11:00 p.m. (approx.)</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To create the venue grounds so it is visually appealing, effective and safe for patrons, volunteers and performers.</p>',
    visible: false,
    title: 'Laurier Avenue Music Stage - LAMS',
    duties_and_responsibilities: '<p>Set up and deconstruct the settings</p><p>    Move tables, chairs, equipment</p><p>    Construct the site areas as required</p><p>    Collect tickets from patrons</p><p>    Help clean up area at the end of the night</p>',
    qualifications_and_requirements: '<p>Friendly, energetic, efficient and reliable</p><p>    Enjoy working with others </p><p>    Be able to work in a fast-paced environment</p><p>    Often requires you to stand on your feet for long periods of time</p><p>    Confident dealing with the general public – effective communication skills</p><p>    Clean, with comfortable footwear</p>',
    shifts: '<p>Laurier Avenue Music Stage - LAMS Tent - Marion Dewar Plaza</p><p>Shift 1: 11:30 a.m. - 1:15 p.m.  Minimum 4 shifts  PLUS 1 Shift 2 or Shift 3 required (because these shifts are so short).</p><p>Shift 2: 7:00 p.m. - 9:30 p.m. Minimum 4 shifts required. (JUNE 21 Start time is 6:00 p.m.)</p><p>Shift 3: 9:30 p.m. - 12:30 a.m. Minimum 4 shift required.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>Using professional education and skills, volunteers on this crew will assist in the administration of first aid to our patrons by assessing and treating patients within a specific scope of practice. Previous first aid and CPR qualifications are mandatory.</p>',
    visible: false,
    title: 'Medical Volunteer',
    duties_and_responsibilities: '<p>Assist in the administration of first aid </p><p>Call emergency responders</p>',
    qualifications_and_requirements: '<p>Proof of First Aid training </p><p>Ability to remain calm under pressure </p><p>Must be 18 years of age or older </p><p>Takes direction well </p><p>May be required to lift heavy instruments </p><p>Suited to friendly, outgoing and responsible person </p><p>A high level of professionalism </p><p>Reports to the Site Volunteer Supervisor</p>',
    shifts: '<p>As a volunteer medical professional you will be asked to act as an onsite first-aid respondent during shift hours at Confederation Park and Marion Dewar Plaza</p><p>Shifts are CP 5:00 p.m. - 11:00 p.m. (approx.) and MDP 6:30 p.m. - 1:00 a.m. (approx.)</p><p>     EXCEPT JULY 1, shifts are 11:00 a.m. - 3:30 p.m. OR 3:30 p.m. - 8:00 p.m.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To serve beer, wine, and (in some locations) coolers to Festival patrons in a courteous, efficient, and professional manner.</p>',
    visible: false,
    title: 'Beer Tent',
    duties_and_responsibilities: '<p>Pour and serve alcoholic beverages in a responsible manner. Work cash box including checking patrons’ IDs and applying all other aspects of Smart Serve as well as handling money. Handle inventory, including transporting and changing kegs in a safe and responsible manner.</p>',
    qualifications_and_requirements: '<p>Friendly, confident and reliable. Possess good judgment and professionalism. Ability to work in a fast-paced environment. Keen verbal communication skills. Smart Serve certification is a must. Experience in money handling is preferred.</p>',
    shifts: '<p>Beer Tent - Various locations at Confederation Park and Marion Dewar Plaza</p><p>Confederation Park Shifts 5:00 p.m.  -  11:00 p.m. (approx. closing time) daily EXCEPT July 1 - shift TBD</p><p>Marion Dewar Plaza Shifts 7:00 p.m.  -  12:30 a.m. (approx. closing time) daily EXCEPT July 1 - shift TBD</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To ensure only people who are in possession of a valid ticket to attend or participate in a show gain access to the event.</p>',
    visible: false,
    title: 'Box Office Evening',
    duties_and_responsibilities: '<p>Selling event tickets, festival passes, providing information on various events.</p>',
    qualifications_and_requirements: '<p>Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities (to provide info. on shows on later dates). Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling - credit card/debit payments and computer experience is preferred. However, training for this will be provided.</p>',
    shifts: '<p>Box Office Evening at Confederation Park and Marion Dewar Plaza</p><p>Shifts - Daily CP 6:30 - 9:00 p.m.(approx.) & MDP 9:30 p.m. - 12:00 a.m.(approx.)</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To maintain the bar in the VIP tent.</p>',
    visible: false,
    title: 'VIP Tent Barback',
    duties_and_responsibilities: '<p>Include but are not limited to: stocking the bar prior to the beginning of each shift (ice, non-alcoholic drinks, glasses, wine and beer kegs); maintaining ice, pop/water and alcohol stock throughout the evening. Managing drink counts. This job requires heavy lifting, as you will be required to lift a keg into the reefer. If you don\'t have prior knowledge of keg changes training will be provided. It is preferred that you have your smart serve certification so that you can work the bar during down time, however it is not necessary.</p>',
    qualifications_and_requirements: '<p>There is some intermittent heavy lifting involved so if you require back support you will have to provide it yourself. We supply you with a T-shirt but ask that you wear dark coloured bottoms. No flip flops permitted.</p>',
    shifts: '<p>Bar stock person.</p>'
  },
  {
    objective: '<p>To ensure only those with VIP tickets are permitted in the tent. Ensure VIP corporate partners enjoy an informative, hospitable experience.</p>',
    visible: false,
    title: 'VIP Tent',
    duties_and_responsibilities: '<p>Attend to requests,(as directed by the VIP Coordinator or Sponsorship Coordinator). Manage gate entrance to ensure on those with a valid ticket or who are on an invite list are permitted in the tent. Provide needed information and assist corporate partner representatives as needed. Bar service is provided within the VIP Tent - this includes pouring beer from a keg and/or pouring wine. As per Smartserve, ensuring that patrons are not over-served. Providing information on all other venues, concerts going on during the festival. Able to direct patrons to various locations throughout the park or off-site, e.g. 4th Stage at the NAC.</p>',
    qualifications_and_requirements: '<p>Good understanding of and appreciation for the value of strong corporate partnerships. Friendly, confident and reliable. Possess good judgment and professionalism. Ability to work in a fast-paced environment. Keen verbal communication skills. Must be friendly, efficient and reliable. Must be cognizant with the Festival program and activities. Often requires you to stand on your feet for long periods of time outdoors. Be able to work in a fast-paced environment as well as deal with patrons in a professional manner. Experience in money handling preferred, Smartserve required. You are provided a T-shirt,  please wear it. Dark bottoms are preferred behind the bar, better to hide spills. No flip flops allowed.</p>',
    shifts: '<p>VIP Tent - Gate and Bar Service. Shifts are 5:30 p.m. - 11:30 p.m. (usually but no later than midnight)</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To make sure the door is managed - on site at the Backstage, selling/scanning tickets for Backstage performances, managing the Backstage jazz queues and helping direct the general public to the locations / events they are seeking.</p>',
    visible: false,
    title: '4th Stage',
    duties_and_responsibilities: '<p>Be familiar with the NAC (e.g. location of washrooms, other performance spaces, ATM, elevator, NAC box office, etc.). Learn what other public performances are taking place in the NAC on the same evening, including the jazz festival NAC Studio series. (For private functions such as weddings, graduations, corporate events, etc., direct attendees to the NAC information kiosk downstairs in the main lobby). Be aware of what other jazz festival concerts are being presented on the same day in it\'s sister venue - NAC Studio Series - as well as other venues, and where other jazz festival sites and services are located (e.g., festival box office, Laurier Avenue Canadian Music Stage). Ensure that people are directed to where they want to go, be it one of the 4th Stage queues, somewhere else in the NAC, somewhere outside the building or to someone else in the NAC who can assist (e.g., Information). Assist NAC ushers as appropriate with, e.g., queue management, ensuring everyone has a valid ticket or pass, etc.  Respond to questions from the public: aside from NAC-specific questions, you could be asked anything from, e.g. where are the paintings? where can I find something to eat?; where is Glenn Gould’s piano?-- deal with issues that may arise.</p><p>For cash/box office volunteers:  collect cash float, tickets, supplies, etc. from Admin trailer in Confederation Park one hour ahead of the first show;• sell and distribute concert tickets at the 4th Stage door; • reconcile cash, receipts and tickets for each concert; • return cash and tickets to Admin trailer approximately one hour after the last show begins.[note: these activities may change due to introduction of scanners</p>',
    qualifications_and_requirements: '<p>Must enjoy working with the public, be outgoing and adaptable. Preference will be given to those with cash experience.</p>',
    shifts: '<p>Located outside the entrance to the NAC Garage (at the rear of the NAC, closest to Confederation Park), we are a Jazz Festival presence. </p><p>Shifts are USUALLY 5:15 p.m. - 9:00 p.m. There may be some some dates that have an earlier concert.</p><p>(All volunteers are asked to arrive 15 minutes prior to shift start time.)</p>'
  },
  {
    objective: '<p>To manage the technical and logistical aspects of the Main and Laurier Avenue Stages to guarantee the best possible jazz concerts.</p>',
    visible: true,
    title: 'Stage',
    duties_and_responsibilities: '<p>Assist with setting up the stage infrastructure at the beginning of the festival and tearing down the stage infrastructure at the end of the festival. May accompany drivers to transport equipment betweenperformance venues</p>',
    qualifications_and_requirements: '<p>Friendly, energetic, efficient and reliable.  Ability to lift, shift and strike up to 50 pounds of technical equipment both on and off stage. Work promptly and efficiently during set changes. Willing to learn staging and lighting procedures and equipment. Able to take direction. Willing to work with others in a team environment. Knowledge of sound and/or lighting equipment and stage set-up is helpful but not essential. Not be afraid of heights, comfortable climbing and working at heights.  Be able to work in a fast-paced environment. Willing to tackle whatever jobs need to be done to put the show on. </p><p>TO BE PART OF THE STAGE CREW YOU MUST WEAR SAFETY FOOTWEAR FOR ALL SHIFTS, OTHERWISE YOU WILL BE SENT HOME.</p>',
    shifts: '<p>PRE/POST FESTIVAL: We are currently looking for volunteers who are available for set-up and tear-down. The dates for for set-up are June 15 - June 22 and the shift times are 9 a.m. to 5 p.m. Tear-down dates for stage begin the night of July 3rd and carry on into the 4th. Work overnight will go at least until 2 or 3 in the morning. All sound gear from both stages as well as lighting and maybe the truss have to be struck and loaded before lunch July 4th. Work on the 4th will be a 9 to 5 affair. </p><p>DURING FESTIVAL: Shifts vary in length between 8 and 10 hours.  Volunteers work either on Main Stage (1 or 2 crews, depending on the size of act, on 2 shifts, 8 to 10 hours per shift) or on the OLG/Laurier Stage, Marion Dewar Plaza venue (1 crew, 1 shift 8-10 hours), between the hours of 3 p.m. and 12 a.m.'
  }
]

opportunities.each do |opportunity|
  v = VolunteerOpportunity.find_or_initialize_by(title: opportunity[:title])
  VolunteerOpportunity.create(opportunity) if v.new_record?
end
