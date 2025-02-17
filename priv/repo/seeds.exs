# # Script for populating the database. You can run it as:
# #
# #     mix run priv/repo/seeds.exs
# #
# # Inside the script, you can read and write to any of your
# # repositories directly:
# #
# #     Globaltide.Repo.insert!(%Globaltide.SomeSchema{})
# #
# # We recommend using the bang functions ("insert!", "update!"
# # and so on) as they will fail if something goes wrong.

alias Globaltide.Repo
alias Globaltide.Job

jobs = [
  %{
    imgRef: "/images/updates/entertainment.jpg",
    jobTag: "Entertainment",
    jobTitle: "Youth Staff",
    shortDesc:
      "Join our Entertainment Team as Youth Staff and create unforgettable experiences for young guests. From fun activities to educational programs, bring energy and excitement to life at sea",
    longDesc: [
      "Set sail on an exciting career adventure as Youth Staff, where you'll play a vital role in delivering engaging activities and programs for children and teens aboard our ships.",
      " From organizing themed parties to hosting educational and recreational activities, you'll create a safe, fun, and vibrant environment for our youngest guests.",
      " Working with a passionate Entertainment Team, you'll ensure that every child and teen onboard has a memorable experience. If you're enthusiastic, creative, and ready for an adventure, this role is your opportunity to shine"
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Develop and lead a variety of age-appropriate activities, including arts and crafts, sports, games, and themed events.",
      "Ensure the safety and well-being of children and teens during all activities.",
      "Communicate effectively with parents and guardians about their children's participation and needs.",
      "Collaborate with the Entertainment Team to create innovative and fun programming.",
      "Maintain a clean and organized environment in all youth activity areas.",
      "Participate in team meetings, training sessions, and safety drills as required by ship protocol.",
      "Actively engage with children and teens to build rapport and ensure a positive experience.",
      "Adhere to all company policies, including those related to health, safety, and sanitation."
    ],
    minRequirements: [
      "Fluency in conversational English, with excellent communication skills and a positive attitude.",
      "Experience working with children or teens in educational, recreational, or childcare settings.",
      "Ability to create and deliver age-appropriate programs that are fun and engaging.",
      "Energetic, creative, and able to adapt to a dynamic environment.",
      "CPR and First Aid certification is preferred."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Coversation English",
      "Youth Engagement",
      "Physically Fit",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "You should have 1-2 years of experience working with children or teens in relevant settings.",
      "Fluency in spoken English to communicate effectively with guests and colleagues is required.",
      "Must have a passion for engaging with children and teens in creative ways.",
      "You must pass a Seafarers Medical Fitness Examination.",
      "You are enthusiastic, flexible, and ready to contribute to a vibrant team environment."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/repairman-blk.jpg",
    jobTag: "Deck Departments",
    jobTitle: "Repairman",
    shortDesc:
      "Take on a critical role in the Deck Department as a Repairman, ensuring the ship's mechanical and operational systems are maintained at top performance.",
    longDesc: [
      "Embark on a fulfilling career at sea as a Repairman, where you'll be responsible for maintaining and repairing essential ship equipment and systems.",
      " Working as part of the Deck Department, your expertise will ensure the safety, functionality, and efficiency of the vessel's operations.",
      " From routine maintenance to troubleshooting and repairing mechanical issues, you'll play an essential role in keeping the ship in excellent condition. If you're hands-on, detail-oriented, and eager for a career full of challenges and opportunities, this is the perfect role for you"
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Conduct regular maintenance and repairs on mechanical and operational systems onboard.",
      "Assist in troubleshooting and fixing issues with various equipment and machinery.",
      "Follow detailed maintenance schedules and maintain accurate repair logs.",
      "Ensure compliance with safety and operational standards during all repair activities.",
      "Collaborate with the Deck Department team to prioritize repair needs and tasks.",
      "Respond to emergency repair requests promptly and efficiently.",
      "Assist in inspections and provide feedback on potential equipment improvements.",
      "Participate in drills, safety meetings, and mandatory training sessions as required.",
      "Ensure all tools and equipment are in good working condition and stored properly."
    ],
    minRequirements: [
      "Proven experience in mechanical repair or maintenance roles, preferably in marine environments.",
      "Basic knowledge of mechanical systems, tools, and repair techniques.",
      "Ability to read and interpret technical manuals and schematics.",
      "Physically fit and capable of working in confined spaces or at heights.",
      "Fluency in conversational English with strong problem-solving and teamwork skills."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Mechanical Knowledge",
      "Problem-Solving Skills",
      "Physical Stamina",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "At least 1-2 years of experience in mechanical repair or related fields.",
      "Basic understanding of mechanical systems and tools required for repair tasks.",
      "Strong troubleshooting skills and the ability to work under pressure.",
      "Physically capable of handling demanding tasks in challenging environments.",
      "Approach tasks with enthusiasm, adaptability, and a proactive mindset."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/deck.jpg",
    jobTag: "Deck Departments",
    jobTitle: "Deck Crew Member",
    shortDesc:
      "Embark on a maritime career as a Deck Crew Member, where you'll play a crucial role in ship operations and safety. Join a skilled team and contribute to maintaining smooth sailing at sea.",
    longDesc: [
      "Start your career as a Deck Crew Member and take on essential responsibilities in supporting the vessel's operational and safety requirements. From assisting with navigation to maintaining ship cleanliness and readiness, you’ll be a key contributor to the crew’s success.",
      "Working closely with the Deck Department, you’ll perform duties like mooring, maintenance of deck equipment, and cargo operations. Your role is vital in ensuring the safety and efficiency of shipboard functions.",
      "This position is ideal for individuals with a strong work ethic, adaptability to dynamic environments, and a passion for maritime operations."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Assist in navigation, including lookout duties and standing watch as directed by supervisors.",
      "Handle mooring lines and anchor operations to ensure the vessel’s secure docking and undocking.",
      "Perform regular maintenance of deck equipment, including painting, cleaning, and repairs.",
      "Ensure the cleanliness and organization of all deck areas to maintain operational readiness.",
      "Support cargo loading and unloading operations as per safety protocols.",
      "Participate in emergency drills and assist with implementing safety measures during emergencies.",
      "Follow all maritime regulations, safety standards, and company policies.",
      "Collaborate with other departments to support the overall efficiency of shipboard operations."
    ],
    minRequirements: [
      "Basic knowledge of maritime operations is preferred but not mandatory.",
      "Physically fit to handle physically demanding tasks, including working in various weather conditions.",
      "Ability to work well in a team-oriented environment with excellent communication skills.",
      "Commitment to maintaining safety standards and adhering to operational protocols.",
      "Willingness to work flexible hours, including nights, weekends, and holidays.",
      "Fluency in conversational English is required."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Maritime Knowledge",
      "Teamwork Skills",
      "Physical Fitness",
      "Safety Orientation"
    ],
    sideDesc: [
      "Entry-level candidates are welcome; prior maritime experience is advantageous.",
      "Familiarity with ship operations and navigation practices is beneficial.",
      "Strong collaboration and communication abilities are essential for success.",
      "Must be physically capable of performing tasks in demanding conditions.",
      "Commitment to adhering to safety procedures and regulations at all times."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/asss-electrician.jpg",
    jobTag: "Deck Departments",
    jobTitle: "Assistant Electrician",
    shortDesc:
      "Launch your maritime career as an Assistant Electrician, where you'll support the ship’s electrical systems and ensure safe, efficient operations at sea. Be a vital part of the team that keeps everything running smoothly.",
    longDesc: [
      "Begin your journey as an Assistant Electrician and join the technical team responsible for maintaining and repairing the ship’s electrical systems. This role is essential in ensuring the safety and functionality of all electrical components on board.",
      "You’ll assist in troubleshooting, installing, and maintaining electrical systems across the vessel, including lighting, power distribution, and emergency systems. Collaborating with the Electrical Department, you’ll ensure the ship operates efficiently and adheres to safety standards.",
      "If you have a passion for problem-solving, enjoy working in a hands-on technical environment, and are eager to grow your career in maritime engineering, this position offers a rewarding and challenging opportunity."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Assist in the maintenance and repair of electrical systems, including lighting, power, and control systems.",
      "Troubleshoot electrical malfunctions and ensure timely resolutions to minimize downtime.",
      "Support the installation and testing of new electrical equipment and systems.",
      "Monitor the condition of electrical systems and report any potential issues to supervisors.",
      "Perform routine inspections of electrical components to ensure compliance with safety standards.",
      "Collaborate with the Deck and Engineering teams to ensure seamless operations across departments.",
      "Follow company protocols and safety guidelines during all maintenance activities.",
      "Participate in safety drills and training sessions to stay updated on shipboard emergency procedures.",
      "Keep accurate records of maintenance tasks, repairs, and inspections as directed by supervisors."
    ],
    minRequirements: [
      "Basic understanding of electrical systems and wiring is required; formal training or certification is preferred.",
      "Experience in electrical maintenance or repair is advantageous but not mandatory.",
      "Ability to work in a physically demanding environment, including confined spaces and at heights.",
      "Strong problem-solving skills and attention to detail for diagnosing and resolving technical issues.",
      "Fluency in conversational English with a team-oriented, proactive approach.",
      "Willingness to work flexible hours, including nights, weekends, and holidays.",
      "Commitment to adhering to safety regulations and maritime standards."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Technical Skills",
      "Problem-Solving Abilities",
      "Physical Stamina",
      "Safety Awareness"
    ],
    sideDesc: [
      "Entry-level candidates are welcome; prior electrical experience is a plus.",
      "Proficiency in handling basic electrical tools and understanding wiring systems.",
      "Ability to identify, analyze, and solve technical challenges efficiently.",
      "Must be physically capable of performing tasks in challenging environments.",
      "Commitment to adhering to safety protocols and maintaining a secure work environment."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/chef-de-partie-2.jpg",
    jobTag: "Galley",
    jobTitle: "Chef De Partie",
    shortDesc:
      "Kickstart your culinary career as a Chef De Partie, where you'll lead a section of the galley team to create exceptional dining experiences for guests and crew alike.",
    longDesc: [
      "Join our culinary team as a Chef De Partie and take charge of a specific section in the galley. You will be responsible for preparing high-quality dishes, maintaining kitchen standards, and ensuring seamless operations in your assigned area.",
      "Working closely with Sous Chefs and the Executive Chef, you’ll supervise junior team members, oversee food preparation, and ensure dishes are presented to the highest standards. Your role is critical in delivering exceptional dining experiences onboard.",
      "If you’re passionate about culinary excellence, thrive in fast-paced environments, and have a keen eye for detail, this position offers an incredible opportunity to advance your culinary career while traveling the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Supervise and manage a specific section of the galley, ensuring smooth operations and high-quality output.",
      "Prepare and present dishes according to established recipes and plating standards.",
      "Ensure ingredients and supplies are available and organized for efficient meal preparation.",
      "Train and mentor junior kitchen staff to maintain consistency and quality in food production.",
      "Collaborate with the Sous Chef and other team members to ensure timely and efficient service.",
      "Maintain hygiene and sanitation standards, ensuring compliance with USPH and company guidelines.",
      "Monitor food storage and stock levels, reporting any shortages or discrepancies.",
      "Assist in menu planning and contribute innovative ideas to enhance the dining experience.",
      "Participate in safety drills, team meetings, and training sessions as required."
    ],
    minRequirements: [
      "Formal culinary training or equivalent experience in a professional kitchen.",
      "Proven experience in a similar role, preferably in a high-volume or fine-dining setting.",
      "Strong understanding of food safety, hygiene, and sanitation practices.",
      "Ability to lead and motivate a team in a dynamic and fast-paced environment.",
      "Excellent organizational and time-management skills to handle multiple tasks efficiently.",
      "Fluency in conversational English and a collaborative, team-focused attitude.",
      "Willingness to work flexible hours, including evenings, weekends, and holidays."
    ],
    req: "Requirement",
    sideHead: [
      "Culinary Expertise",
      "Leadership Skills",
      "Attention to Detail",
      "Team Collaboration",
      "Creativity"
    ],
    sideDesc: [
      "Strong culinary knowledge and proficiency in preparing a variety of dishes.",
      "Proven ability to supervise and train kitchen staff effectively.",
      "Commitment to delivering high-quality dishes with precision and consistency.",
      "Collaborative approach to working with team members in a high-pressure environment.",
      "Passion for experimenting with flavors and creating innovative menu ideas."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/Management-rainee.jpg",
    jobTag: "Galley",
    jobTitle: "Management Trainee Galley",
    shortDesc:
      "Kickstart your culinary career as a Management Trainee in the Galley, where you will gain valuable hands-on experience in shipboard kitchen operations and contribute to delivering exceptional dining experiences.",
    longDesc: [
      "Step into a dynamic role as a Management Trainee in the Galley, where you’ll receive immersive training in the ship’s culinary operations. From food preparation to maintaining kitchen cleanliness, this position offers a comprehensive introduction to galley management.",
      "You will assist the kitchen team with food preparation, inventory management, and adherence to hygiene standards. This role also includes shadowing senior kitchen staff to learn the intricacies of shipboard operations and gain skills in kitchen leadership.",
      "If you're passionate about food, eager to learn, and ready to take on challenges in a fast-paced environment, this position offers the perfect opportunity to start your career in galley management while gaining hands-on experience in an exciting maritime setting."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Assist with food preparation and cooking under the guidance of senior galley staff.",
      "Ensure kitchen cleanliness by maintaining hygiene standards and sanitizing workspaces.",
      "Assist in inventory management, including stock rotation and ordering supplies.",
      "Support senior chefs in preparing and presenting dishes for guests and crew.",
      "Participate in daily kitchen operations, ensuring the efficient delivery of food services.",
      "Learn kitchen equipment maintenance and assist in ensuring all tools are properly cleaned and stored.",
      "Monitor food safety standards and ensure compliance with health regulations.",
      "Participate in team meetings and contribute to the overall operational improvements of the galley.",
      "Shadow senior kitchen staff to develop leadership and management skills in galley operations."
    ],
    minRequirements: [
      "A strong interest in the culinary arts with a willingness to learn and grow in a fast-paced environment.",
      "Basic understanding of kitchen operations, food safety, and hygiene practices.",
      "Ability to work well in a team, maintaining a positive and proactive attitude.",
      "Physical stamina to work long hours, including standing for extended periods.",
      "Fluency in conversational English with strong communication skills.",
      "Willingness to work flexible hours, including weekends and holidays.",
      "Previous experience in a kitchen or hospitality environment is a plus but not mandatory."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Culinary Knowledge",
      "Teamwork Skills",
      "Physical Stamina",
      "Learning Attitude"
    ],
    sideDesc: [
      "No formal experience required, but a passion for culinary arts is essential.",
      "Basic knowledge of kitchen equipment, food safety, and food preparation processes is helpful.",
      "Strong interpersonal skills for collaborating effectively with a diverse team.",
      "Ability to handle physically demanding tasks and work in a fast-paced kitchen environment.",
      "A willingness to learn quickly, take initiative, and absorb knowledge from experienced kitchen professionals."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/executive-chef.jpg",
    jobTag: "Galley",
    jobTitle: "Executive Sous Chef",
    shortDesc:
      "Join our culinary team as an Executive Sous Chef, where you'll play a key role in managing kitchen operations, supporting the Executive Chef, and ensuring exceptional dining experiences for our guests.",
    longDesc: [
      "Step into a dynamic leadership role as an Executive Sous Chef, responsible for overseeing kitchen operations, supervising the culinary team, and ensuring the quality and presentation of all food served to guests. As a vital member of the Galley team, you will collaborate with the Executive Chef to maintain high culinary standards, manage inventory, and ensure smooth day-to-day operations.",
      "You’ll work in a fast-paced environment, ensuring that food preparation adheres to strict hygiene, safety, and quality standards. In this role, you’ll also be expected to assist in menu planning, oversee the preparation of meals, and provide guidance to junior kitchen staff.",
      "If you have a passion for leadership, culinary excellence, and guest satisfaction, this is the perfect opportunity to advance your career at sea, where no two days are alike"
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Assist the Executive Chef in managing the kitchen operations and supervising kitchen staff.",
      "Oversee food preparation, ensuring dishes meet quality standards and are presented beautifully.",
      "Coordinate the preparation of meals, ensuring smooth flow during service hours.",
      "Maintain cleanliness, hygiene, and safety standards in all kitchen and food preparation areas.",
      "Monitor food inventory, manage ordering and stocking, and minimize waste.",
      "Train, mentor, and evaluate kitchen staff to ensure high performance and efficiency.",
      "Support the creation of innovative menus and ensure the kitchen follows them consistently.",
      "Ensure compliance with USPH, HACCP, and other relevant food safety regulations.",
      "Act as the Executive Chef in their absence, maintaining kitchen operations and team management."
    ],
    minRequirements: [
      "Proven experience as a Sous Chef or in a leadership culinary position, preferably in large-scale kitchen operations.",
      "Strong knowledge of kitchen safety, hygiene practices, and food preparation standards.",
      "Fluency in English, with excellent communication and leadership skills.",
      "Ability to work under pressure in a high-volume, fast-paced environment.",
      "Exceptional organizational skills, attention to detail, and a commitment to culinary excellence.",
      "Flexibility to work long hours, including nights, weekends, and holidays as needed."
    ],
    req: "Requirement",
    sideHead: [
      "Leadership Experience",
      "Culinary Skills",
      "Food Safety Knowledge",
      "Time Management",
      "Adaptability"
    ],
    sideDesc: [
      "At least 3-5 years of experience in culinary leadership roles, such as a Sous Chef or Chef de Partie.",
      "Proven expertise in preparing high-quality, consistent dishes and overseeing meal service.",
      "Thorough understanding of hygiene, safety regulations, and food handling practices.",
      "Ability to manage time effectively, ensuring that kitchen operations run smoothly during peak service periods.",
      "Must be adaptable, with a flexible approach to changing needs in a fast-paced kitchen environment."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/waiter.jpg",
    jobTag: "Restaurant",
    jobTitle: "Waiter",
    shortDesc:
      "Join our team as a Waiter and be part of delivering exceptional dining experiences. Play a crucial role in providing outstanding guest service and food presentation at every meal.",
    longDesc: [
      "Start your career as a Waiter and be a vital part of our Food & Beverage team, ensuring guests have a top-tier dining experience. You will be responsible for taking orders, serving food and drinks, and ensuring the dining area is clean and inviting.",
      "Your role involves providing excellent customer service, ensuring food is presented beautifully, and maintaining high standards of cleanliness and organization. You’ll work closely with both the kitchen and fellow team members to deliver an exceptional dining experience for all guests.",
      "If you enjoy interacting with people, have a passion for food service, and thrive in a fast-paced environment, this is the perfect opportunity to build your career while working at sea"
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Arrive at work on time and in the company-specified uniform.",
      "Provide friendly, professional service to guests, ensuring their dining needs are met.",
      "Take food and drink orders accurately and deliver them to guests in a timely manner.",
      "Ensure the cleanliness and organization of the dining area during service.",
      "Assist in setting up and clearing tables, maintaining a clean environment throughout the meal period.",
      "Coordinate with kitchen staff to ensure the accuracy and quality of food served.",
      "Monitor guest satisfaction and respond promptly to any requests or concerns.",
      "Adhere to safety and sanitation standards, ensuring the dining area is safe and hygienic.",
      "Attend safety drills and meetings as required by the ship’s command."
    ],
    minRequirements: [
      "Fluency in conversational English with a positive, friendly attitude.",
      "Previous experience in food service, especially in a waiter role, is an advantage.",
      "Ability to maintain high standards of hygiene, food safety, and cleanliness.",
      "Excellent interpersonal and communication skills to interact with guests.",
      "A passion for providing excellent service and a positive dining experience for all guests.",
      "Physical stamina to handle long hours on your feet and move food and drink items efficiently."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Conversational English",
      "Guest Service Skills",
      "Physical Stamina",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "Previous experience in a similar food service role is preferred.",
      "Fluency in spoken English is necessary for effective communication with guests.",
      "Excellent customer service skills to ensure a positive guest dining experience.",
      "Must be physically fit to manage the demands of waiting tables and being on your feet for extended periods.",
      "A proactive, positive attitude is essential to excel in this role and contribute to a harmonious team environment."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/winesteward.jpg",
    jobTag: "Beverages",
    jobTitle: "Wine Steward",
    shortDesc:
      "Join our team as a Wine Steward and be a key part of delivering exceptional wine service. You’ll provide expert recommendations, ensure proper wine storage, and elevate guest experiences with your knowledge of fine wines.",
    longDesc: [
      "Start your journey as a Wine Steward and become an essential member of our beverage team. In this role, you'll assist in curating an outstanding wine list, serving wines to guests, and ensuring all wine-related operations run smoothly.",
      "Your responsibilities include providing expert wine recommendations to guests, ensuring proper wine storage and handling, and maintaining the wine cellar. You'll also be responsible for managing wine pairings with meals, ensuring that every guest has a memorable dining experience.",
      "If you're passionate about wine, have excellent communication skills, and enjoy providing exceptional service in a fine dining environment, this role offers a fantastic opportunity to grow your career at sea"
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Assist in curating and managing the wine list, ensuring a variety of wines are available to guests.",
      "Provide wine recommendations and educate guests on wine pairings with meals.",
      "Serve wine in accordance with company standards, ensuring proper wine etiquette.",
      "Maintain the wine cellar, ensuring proper storage conditions and rotation of stock.",
      "Monitor wine stock levels and place orders as needed to ensure availability.",
      "Work closely with the kitchen team to ensure proper wine pairing with menu items.",
      "Ensure cleanliness and organization in the wine storage area, including shelves and racks.",
      "Engage with guests, offering wine knowledge and answering any related questions.",
      "Attend all meetings and safety drills as requested by the ship’s command."
    ],
    minRequirements: [
      "Fluency in conversational English, with a friendly and approachable demeanor.",
      "Previous experience as a wine steward, sommelier, or in a similar role is an advantage.",
      "Strong knowledge of wines, wine regions, and wine pairings.",
      "Ability to provide excellent customer service and communicate effectively with guests.",
      "Physical stamina to carry and serve wine bottles, and stand for extended periods.",
      "Willingness to work flexible hours, including weekends and holidays."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Wine Knowledge",
      "Guest Interaction",
      "Physical Stamina",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "Previous experience in wine service or sommelier roles is preferred.",
      "Strong understanding of wine varieties, regions, and how they pair with different foods.",
      "Exceptional guest service skills, with a focus on delivering a top-notch experience.",
      "Physically fit and able to handle the demands of serving and storing wine.",
      "Approachable, positive, and always eager to learn and improve."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/bartender.jpg",
    jobTag: "Beverages",
    jobTitle: "Bartender",
    shortDesc:
      "Join our dynamic team as a Bartender, where you’ll be a key player in providing excellent beverage service and crafting memorable experiences for guests at sea.",
    longDesc: [
      "Embark on your maritime career as a Bartender, where you'll be responsible for preparing and serving drinks, managing the bar area, and ensuring guests receive exceptional service. You’ll work with a team to create a vibrant and welcoming environment while adhering to high standards of hospitality.",
      "Your role includes preparing a wide variety of alcoholic and non-alcoholic beverages, managing bar supplies, and ensuring the bar area is clean and well-stocked. As a Bartender, you’ll interact with guests, offer recommendations, and create an enjoyable atmosphere.",
      "If you are passionate about mixology, enjoy engaging with people, and have a flair for creating unique drinks, this is your opportunity to grow your career in the hospitality industry while exploring the world at sea"
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Prepare and serve alcoholic and non-alcoholic beverages in accordance with company standards.",
      "Maintain cleanliness and organization of the bar area to ensure a positive guest experience.",
      "Ensure the bar is well-stocked with supplies, including glasses, garnishes, and alcohol.",
      "Interact with guests, taking orders, offering recommendations, and ensuring prompt and efficient service.",
      "Follow all safety and sanitation procedures related to alcohol service and food handling.",
      "Assist in managing the inventory, including tracking and ordering bar supplies.",
      "Engage with guests in a friendly, professional manner to create a welcoming environment.",
      "Attend training sessions, safety drills, and meetings as requested by supervisors."
    ],
    minRequirements: [
      "Previous experience as a bartender or in a hospitality role is preferred.",
      "Fluency in conversational English, with excellent communication skills and a guest-oriented attitude.",
      "Strong knowledge of beverages, cocktails, and bar service techniques.",
      "Ability to handle alcohol responsibly and comply with all relevant laws and regulations.",
      "Willingness to work flexible hours, including nights, weekends, and holidays.",
      "Ability to work in a fast-paced environment while maintaining attention to detail."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Communication Skills",
      "Mixology Knowledge",
      "Guest Interaction",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "Previous experience as a bartender is preferred, but not required for entry-level candidates.",
      "Fluency in English is crucial for effective communication with guests and team members.",
      "Strong knowledge of cocktails and beverages, with a passion for mixology.",
      "Must be able to engage with guests in a positive and professional manner.",
      "Bring enthusiasm, adaptability, and a proactive attitude to your role as a bartender."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/security-officer.jpg",
    jobTag: "Deck Departments",
    jobTitle: "Security Officer",
    shortDesc:
      "Step into your shipboard career as a Security Officer, ensuring the safety and security of guests, crew, and the ship itself. Play a key role in maintaining a secure environment onboard.",
    longDesc: [
      "As a Security Officer, you will be responsible for ensuring the safety and security of all guests, crew members, and the ship’s property. You will patrol the ship, monitor surveillance systems, and respond to emergencies or security breaches as needed.",
      "Your role will involve enforcing safety protocols, assisting in crowd control, and conducting regular checks to prevent theft, accidents, or any other security-related incidents. You'll collaborate with the rest of the crew to create a safe, peaceful environment for everyone onboard.",
      "If you have a keen eye for detail, enjoy working in a fast-paced, dynamic environment, and are passionate about maintaining safety standards, this is your gateway to a rewarding career in maritime security."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Patrol the ship regularly to ensure the safety of all guests, crew, and property.",
      "Monitor surveillance systems and report any suspicious activity to senior officers.",
      "Ensure compliance with safety protocols and assist in maintaining emergency readiness.",
      "Respond to emergencies, including medical incidents, fire drills, and security breaches.",
      "Assist with crowd control during embarkation, disembarkation, and large events.",
      "Investigate and report any incidents or security concerns to senior security personnel.",
      "Collaborate with the ship’s command and other departments to ensure safety standards are met.",
      "Attend all mandatory training and safety drills as directed by supervisors or ship’s command."
    ],
    minRequirements: [
      "Previous experience in security or law enforcement is preferred.",
      "Fluency in conversational English and strong communication skills.",
      "Ability to work under pressure and handle emergencies effectively.",
      "Knowledge of safety and security procedures, including emergency response protocols.",
      "Willingness to work flexible hours, including nights, weekends, and holidays.",
      "Physical fitness is required as the role involves frequent patrols and handling potentially strenuous tasks."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Communication Skills",
      "Emergency Response Skills",
      "Physical Fitness",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "At least 1-2 years of experience in security or a related field is preferred.",
      "Fluent in spoken and written English for communication with guests and the team.",
      "Able to remain calm and respond effectively in emergency situations.",
      "Must be physically capable of performing security patrols and responding to incidents.",
      "A positive and proactive approach with a focus on ensuring safety for everyone onboard."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/gues-officer.jpg",
    jobTag: "Guest Service",
    jobTitle: "Guest Service Officer",
    shortDesc:
      "Join our team as a Guest Service Officer, providing outstanding guest experiences through exceptional service, professionalism, and a welcoming attitude.",
    longDesc: [
      "As a Guest Service Officer, you'll play a key role in ensuring a seamless and memorable stay for guests. Your primary responsibility will be to offer excellent customer service, assisting with check-ins, check-outs, and responding to guest needs with efficiency and enthusiasm.",
      "You will assist guests with inquiries, handle reservations, and ensure that all hotel operations run smoothly, providing guests with the highest level of hospitality throughout their stay.",
      "If you’re a detail-oriented, friendly individual with a passion for providing exceptional service, this role offers the perfect opportunity to develop your career in the hospitality industry."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Greet and welcome guests with a friendly and professional demeanor.",
      "Assist guests with check-in and check-out procedures, ensuring a smooth process.",
      "Respond to guest inquiries, providing information about hotel services and amenities.",
      "Handle guest complaints and resolve issues in a timely and courteous manner.",
      "Coordinate with other departments to ensure guest needs are met promptly.",
      "Maintain accurate records of guest information and special requests.",
      "Ensure the lobby and front desk area are clean and welcoming at all times.",
      "Participate in training, safety drills, and meetings as required by hotel management."
    ],
    minRequirements: [
      "Fluency in conversational English is required; additional languages are a plus.",
      "Previous experience in a guest service or hotel role is preferred but not mandatory.",
      "Strong communication skills and the ability to interact with guests in a friendly and professional manner.",
      "Willingness to work flexible hours, including evenings, weekends, and holidays.",
      "A positive attitude with a strong focus on customer satisfaction.",
      "Ability to multitask and work effectively in a fast-paced environment."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "English Proficiency",
      "Customer Service Skills",
      "Physical Stamina",
      "Problem-Solving Abilities"
    ],
    sideDesc: [
      "At least 1-2 years of experience in customer service, preferably in the hospitality industry.",
      "Fluent in spoken English to assist guests and communicate effectively.",
      "Excellent interpersonal skills for engaging with guests and addressing their needs.",
      "Physically capable of standing for long periods and managing light physical tasks.",
      "Quick-thinking and problem-solving skills to handle guest concerns and requests efficiently."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/photographer.jpg",
    jobTag: "Photo Department",
    jobTitle: "Photographer",
    shortDesc:
      "Join our team as a Photographer and capture unforgettable moments at sea. Help guests preserve their most cherished memories with your professional photography skills.",
    longDesc: [
      "As a Photographer, you'll play a key role in capturing the essence of the cruise experience for our guests. You will be responsible for taking high-quality photos at various shipboard events, from formal portraits to candid moments during activities.",
      "Working with guests, you'll offer personalized photo sessions, ensuring that each guest receives a memorable and professional image. Your creativity and technical expertise will directly contribute to our guests' enjoyment and the lasting memories they take home.",
      "This role is ideal for individuals passionate about photography, customer service, and working in a dynamic, high-energy environment. If you’re ready to showcase your skills and be part of an exciting team at sea, this is the perfect opportunity for you"
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Capture high-quality photographs of guests during various events and activities onboard.",
      "Provide guests with professional photography services, including portraits and candid shots.",
      "Edit and enhance photos using industry-standard software to ensure the best possible results.",
      "Maintain and organize photo equipment and studio spaces to ensure readiness for each session.",
      "Assist in setting up photo stations, backdrops, and props for themed events and sessions.",
      "Engage with guests to make them feel comfortable and confident in front of the camera.",
      "Promote and sell photo packages to guests, ensuring they are satisfied with their purchased products.",
      "Attend safety drills and meetings as required by the ship’s command and follow all company protocols.",
      "Work with other team members to ensure the photo department’s smooth operation and meet sales targets."
    ],
    minRequirements: [
      "Previous experience in photography or a related field is preferred but not mandatory.",
      "Proficiency with digital cameras and photo editing software is required.",
      "Strong communication and interpersonal skills for interacting with guests and team members.",
      "A keen eye for detail, creativity, and an understanding of composition and lighting.",
      "Fluency in conversational English to interact with guests and team members effectively.",
      "Willingness to work flexible hours, including evenings, weekends, and holidays.",
      "Ability to work in a fast-paced environment and meet deadlines while maintaining a high standard of work."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Photography Skills",
      "Guest Interaction",
      "Technical Proficiency",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "Experience in photography or a related field is a plus but not required.",
      "Proficient in using digital cameras and editing software like Photoshop or Lightroom.",
      "Comfortable interacting with guests, creating an enjoyable and relaxed photo session environment.",
      "Able to operate technical equipment and troubleshoot minor issues as they arise.",
      "A positive, proactive attitude is essential to thrive in a dynamic and guest-focused environment."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/casinodealer.jpg",
    jobTag: "Casino",
    jobTitle: "Casino Dealer",
    shortDesc:
      "Start an exciting career at sea as a Casino Dealer, providing top-notch entertainment and gaming experiences for guests. Join a vibrant team and showcase your skills in a dynamic environment.",
    longDesc: [
      "Begin your shipboard career as a Casino Dealer and become an integral part of delivering exceptional entertainment experiences for our guests. As a Casino Dealer, you’ll oversee various gaming tables, ensuring fairness, compliance with gaming rules, and guest satisfaction.",
      "You’ll interact with guests from all over the world, handling games such as blackjack, roulette, and poker while maintaining a professional and engaging demeanor. Your role will also involve assisting guests with understanding the rules and creating a welcoming gaming environment.",
      "If you have a flair for customer service, a keen eye for detail, and a passion for the excitement of the gaming world, this role offers an incredible opportunity to grow your career while exploring the seas."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Facilitate games such as blackjack, poker, roulette, and other table games with professionalism and accuracy.",
      "Ensure compliance with gaming regulations and company policies to maintain a fair gaming environment.",
      "Provide exceptional customer service to guests, assisting with game rules and handling inquiries.",
      "Accurately handle and balance cash, chips, and game outcomes as per company standards.",
      "Promote a positive and engaging atmosphere in the casino to enhance guest experiences.",
      "Monitor gaming activities to identify any irregularities or breaches of rules.",
      "Support other casino staff and participate in team activities to achieve departmental goals.",
      "Attend safety drills, training sessions, and meetings as required by ship protocols.",
      "Maintain a clean and organized workspace, ensuring readiness for operations."
    ],
    minRequirements: [
      "Previous experience as a Casino Dealer or in a similar role is preferred.",
      "Proficiency in at least two table games such as blackjack, roulette, or poker.",
      "Fluency in conversational English and excellent communication skills.",
      "A friendly, guest-focused attitude with the ability to handle high-pressure situations calmly.",
      "Willingness to work flexible hours, including nights, weekends, and holidays.",
      "Ability to pass a Seafarers Medical Fitness Examination.",
      "Commitment to upholding safety and operational protocols at all times."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Table Games Expertise",
      "Customer Service Skills",
      "Physical Stamina",
      "Professional Demeanor"
    ],
    sideDesc: [
      "Prior experience as a Casino Dealer is highly advantageous but not mandatory.",
      "Proficiency in popular casino games like blackjack, poker, and roulette is required.",
      "Excellent communication and interpersonal skills for guest interactions.",
      "Must be physically fit to work long hours and maintain focus during shifts.",
      "Maintain professionalism and a positive attitude, even in challenging situations."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/concierge.jpg",
    jobTag: "Restaurant",
    jobTitle: "Concierge",
    shortDesc:
      "Embark on your shipboard career as a Concierge, where you'll provide personalized guest services, ensuring a seamless and exceptional dining and hospitality experience at sea.",
    longDesc: [
      "Join the team as a Concierge and play a key role in creating unforgettable guest experiences onboard. As the go-to person for dining reservations, special requests, and personalized services, you’ll ensure every guest’s needs are met with care and professionalism.",
      "Your role involves collaborating with various departments to provide smooth service, from arranging special dining experiences to managing guest inquiries. As a Concierge, you’ll help set the tone for luxury and hospitality, leaving lasting impressions.",
      "If you’re organized, approachable, and passionate about delivering high-quality service, this role is your opportunity to excel while traveling the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Welcome guests warmly and provide them with detailed information about dining and onboard services.",
      "Assist guests with restaurant reservations and accommodate special requests for dietary preferences or celebrations.",
      "Coordinate with restaurant teams to ensure seamless service delivery and guest satisfaction.",
      "Manage guest inquiries professionally, offering prompt and accurate solutions.",
      "Ensure a high level of organization and communication between departments to handle guest needs effectively.",
      "Offer personalized recommendations for dining options and onboard activities.",
      "Handle complaints or issues diplomatically and escalate them to supervisors when necessary.",
      "Maintain accurate records of guest preferences and feedback to enhance future services.",
      "Adhere to shipboard safety protocols and company standards at all times."
    ],
    minRequirements: [
      "Fluency in conversational English with excellent communication and interpersonal skills.",
      "Previous experience in hospitality, customer service, or front-of-house roles is highly desirable.",
      "Strong organizational skills and attention to detail.",
      "Ability to work in a fast-paced environment with flexibility in working hours.",
      "A warm, professional demeanor and a passion for guest satisfaction.",
      "Experience with reservation or booking systems is a plus but not required."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Guest Service Expertise",
      "Communication Skills",
      "Organizational Abilities",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "Previous hospitality or customer service experience is preferred.",
      "Demonstrate excellent skills in handling guest interactions and requests.",
      "Fluency in English for clear and professional communication.",
      "Ability to multitask and manage multiple guest needs efficiently.",
      "Positive mindset and willingness to go the extra mile for guest satisfaction."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/activiy-staff.jpg",
    jobTag: "Entertainment",
    jobTitle: "Activity Staff",
    shortDesc:
      "Join the onboard Activity Staff team and create unforgettable experiences through engaging entertainment, recreational activities, and vibrant events for guests of all ages.",
    longDesc: [
      "As part of the Activity Staff, you’ll play a crucial role in enhancing guest experiences by leading a variety of entertainment and recreational activities. From organizing interactive games to hosting lively events, you’ll be at the heart of creating memories for guests.",
      "This position involves collaborating with the entertainment and recreation teams to ensure all activities run smoothly. Your energy and enthusiasm will set the tone for onboard fun, and your ability to engage guests will contribute to a lively and welcoming environment.",
      "If you’re energetic, outgoing, and passionate about entertainment, this role provides a fantastic opportunity to showcase your talents while traveling the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Lead and facilitate engaging activities such as trivia, sports tournaments, arts and crafts, and themed events for guests of all ages.",
      "Collaborate with the entertainment team to design and execute fun and interactive onboard programs.",
      "Engage with guests to create a welcoming and enjoyable atmosphere throughout the ship.",
      "Ensure activity areas are safe, organized, and properly set up for scheduled events.",
      "Promote upcoming activities and encourage guest participation through announcements and interactions.",
      "Handle guest inquiries and provide information about the daily schedule of activities.",
      "Assist with special events, themed parties, and holiday celebrations.",
      "Adapt activities to meet the diverse needs and preferences of guests.",
      "Maintain a high level of energy, enthusiasm, and professionalism during all interactions.",
      "Adhere to shipboard safety protocols and company standards."
    ],
    minRequirements: [
      "Fluency in conversational English with strong communication and interpersonal skills.",
      "Previous experience in entertainment, recreation, or customer-facing roles is preferred.",
      "A lively and outgoing personality with a passion for engaging with people.",
      "Ability to adapt to a fast-paced, dynamic environment with flexible working hours.",
      "Strong organizational skills and the ability to multitask effectively.",
      "Background in performing arts, hosting, or recreation management is a plus.",
      "Physical stamina to participate in active events and activities."
    ],
    req: "Requirement",
    sideHead: [
      "Energetic Personality",
      "Guest Engagement Skills",
      "Flexibility and Adaptability",
      "Team Collaboration",
      "Creative Thinking"
    ],
    sideDesc: [
      "Showcase a fun, energetic, and approachable demeanor that inspires guest participation.",
      "Demonstrate excellent guest interaction and communication skills.",
      "Flexibility to adapt activities based on the preferences and dynamics of the guests.",
      "Ability to work well with other entertainment team members and collaborate effectively.",
      "Innovative mindset to create unique and exciting entertainment experiences."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/dj.jpg",
    jobTag: "Entertainment",
    jobTitle: "Entertainment DJ",
    shortDesc:
      "Elevate onboard energy as an Entertainment DJ, where you'll curate unforgettable musical experiences, set the vibe for events, and keep guests dancing all night long.",
    longDesc: [
      "Step into the spotlight as an Entertainment DJ and take charge of creating an electrifying atmosphere onboard. From spinning tracks at themed parties to curating music for events, your role is essential in delivering an unforgettable entertainment experience.",
      "As a DJ, you’ll work closely with the entertainment team to set the tone for various events, ensuring the music aligns perfectly with the vibe and guest preferences. Your ability to read the room and adapt your playlists will ensure guests stay engaged and energized.",
      "If you’re passionate about music, have a talent for mixing tracks, and love engaging with diverse audiences, this is your chance to shine while traveling the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Curate and mix music playlists to suit a variety of onboard events, including themed parties, lounges, and poolside gatherings.",
      "Engage with guests through music, creating a lively and energetic atmosphere.",
      "Collaborate with the entertainment team to plan and execute music for special events and activities.",
      "Read the crowd to adapt playlists and maintain a high-energy environment.",
      "Ensure all DJ equipment is set up, operational, and maintained to professional standards.",
      "Promote upcoming events and encourage guest participation through engaging announcements.",
      "Stay up-to-date on music trends to keep playlists fresh and exciting.",
      "Assist with sound and lighting coordination to enhance the overall experience.",
      "Adhere to shipboard safety protocols and company standards at all times."
    ],
    minRequirements: [
      "Experience as a DJ in entertainment venues, events, or similar environments.",
      "Proficiency with DJ equipment and software (e.g., Pioneer, Serato, Traktor).",
      "A deep knowledge of various music genres and the ability to cater to diverse audiences.",
      "Strong communication and interpersonal skills to engage with guests and team members.",
      "Ability to work flexible hours, including late nights and weekends.",
      "A creative and energetic approach to music and entertainment.",
      "Previous experience in a cruise or hospitality setting is a plus but not required."
    ],
    req: "Requirement",
    sideHead: [
      "DJ Experience",
      "Music Versatility",
      "Crowd Engagement",
      "Technical Proficiency",
      "Adaptability"
    ],
    sideDesc: [
      "Proven experience as a DJ in live settings such as clubs, events, or parties.",
      "Expertise in mixing a wide range of music genres to cater to diverse audiences.",
      "Strong skills in reading and engaging crowds to maintain energy levels.",
      "Knowledge of professional DJ equipment and software for seamless operation.",
      "Flexibility to adapt playlists and schedules to match the event’s requirements."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/engineer-officer.jpg",
    jobTag: "Deck Departments",
    jobTitle: "Engineer Officer",
    shortDesc:
      "Take the helm of ship operations as an Engineer Officer, ensuring the smooth functioning of critical machinery and systems while maintaining safety and efficiency at sea.",
    longDesc: [
      "Join the team as an Engineer Officer and play a vital role in the seamless operation of the ship’s technical systems. From overseeing machinery to managing maintenance schedules, you’ll ensure the ship remains in peak operational condition.",
      "Your responsibilities will include monitoring engines, maintaining electrical and mechanical systems, and troubleshooting any technical issues that arise. You’ll work as part of a skilled team to ensure the safety and efficiency of ship operations.",
      "If you’re technically skilled, detail-oriented, and eager to be part of a dynamic team, this is your chance to excel while exploring the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Operate and maintain the ship’s engines, boilers, and auxiliary machinery.",
      "Monitor and troubleshoot electrical, hydraulic, and pneumatic systems.",
      "Ensure that all safety and environmental regulations are followed during operations.",
      "Conduct routine inspections and maintenance to prevent breakdowns and delays.",
      "Respond promptly to machinery failures and carry out necessary repairs.",
      "Maintain accurate records of repairs, inspections, and machinery performance.",
      "Collaborate with deck and operations teams to ensure seamless ship functions.",
      "Train and supervise junior engineers and technical staff.",
      "Stay updated on new technology and equipment to improve efficiency and safety."
    ],
    minRequirements: [
      "Bachelor’s degree or equivalent certification in marine engineering or a related field.",
      "Previous experience as a marine engineer or in a similar technical role onboard a ship.",
      "In-depth knowledge of ship systems, including engines, pumps, and electrical components.",
      "Strong troubleshooting and problem-solving skills.",
      "Ability to work under pressure and adapt to challenging environments.",
      "Excellent communication and teamwork skills.",
      "Familiarity with safety and environmental regulations in maritime operations.",
      "Willingness to work flexible hours and be on-call for emergencies."
    ],
    req: "Requirement",
    sideHead: [
      "Technical Expertise",
      "Problem-Solving Skills",
      "Team Collaboration",
      "Safety Compliance",
      "Adaptability"
    ],
    sideDesc: [
      "Comprehensive knowledge of ship machinery and systems is essential.",
      "Strong ability to diagnose and resolve technical issues efficiently.",
      "Experience in working collaboratively within a multidisciplinary team.",
      "Adherence to strict safety and environmental regulations.",
      "Capability to adjust to dynamic situations and work long hours at sea."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/hr.jpg",
    jobTag: "Deck Departments",
    jobTitle: "Human Resource Manager",
    shortDesc:
      "Set sail as a Human Resource Manager and play a pivotal role in supporting and empowering the ship’s crew while ensuring a positive and efficient work environment.",
    longDesc: [
      "Join the team as a Human Resource Manager and oversee crew welfare, development, and organizational effectiveness onboard. From managing recruitment and onboarding to addressing employee concerns, you’ll be the cornerstone of the crew's success and satisfaction.",
      "Your responsibilities include implementing HR policies, fostering team collaboration, and ensuring compliance with maritime labor regulations. With your support, the ship’s crew can focus on delivering exceptional guest experiences.",
      "If you’re organized, approachable, and passionate about creating a positive workplace culture, this role is your chance to lead with purpose while traveling the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Manage crew recruitment, onboarding, and performance evaluations.",
      "Provide guidance and support to crew members regarding HR policies, benefits, and conflict resolution.",
      "Ensure compliance with international maritime labor regulations and company policies.",
      "Foster a positive and inclusive workplace culture onboard.",
      "Coordinate training programs to enhance employee skills and professional growth.",
      "Address employee grievances with discretion and professionalism.",
      "Maintain accurate and confidential HR records.",
      "Collaborate with department heads to meet staffing and operational needs.",
      "Stay updated on HR trends and best practices to improve employee engagement and retention."
    ],
    minRequirements: [
      "Bachelor’s degree in Human Resource Management, Business Administration, or a related field.",
      "Previous experience in HR management, preferably in hospitality, maritime, or related industries.",
      "Strong interpersonal and communication skills with a high level of discretion.",
      "Knowledge of maritime labor laws and regulations is a plus.",
      "Ability to work in a multicultural and fast-paced environment.",
      "Strong organizational skills with attention to detail.",
      "Proficiency in HR systems and software is desirable.",
      "Ability to handle confidential matters with integrity."
    ],
    req: "Requirement",
    sideHead: [
      "Leadership Skills",
      "HR Expertise",
      "Communication Proficiency",
      "Problem-Solving",
      "Cultural Sensitivity"
    ],
    sideDesc: [
      "Demonstrate effective leadership in managing crew welfare and performance.",
      "Thorough understanding of HR principles and regulations, including maritime labor standards.",
      "Excellent written and verbal communication skills in English.",
      "Proven ability to address and resolve employee concerns effectively.",
      "Adaptability and sensitivity to diverse cultural backgrounds onboard."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/jr-waiter.jpg",
    jobTag: "Restaurant",
    jobTitle: "Jr Waiter",
    shortDesc:
      "Kickstart your hospitality career as a Jr Waiter, providing exceptional dining service to guests onboard while gaining valuable experience in a fast-paced, dynamic environment.",
    longDesc: [
      "Step into the role of a Jr Waiter and become an integral part of the dining team, delivering outstanding guest service with a smile. From setting tables to serving meals, you’ll help create memorable dining experiences that leave a lasting impression.",
      "As a Jr Waiter, you’ll work closely with senior staff, ensuring seamless service while maintaining the highest standards of cleanliness and efficiency. This is the perfect role to start building your career in the hospitality industry.",
      "If you’re enthusiastic, detail-oriented, and eager to learn, this position offers a unique opportunity to grow professionally while traveling the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Set up tables and prepare dining areas for service.",
      "Assist waiters in serving food and beverages to guests.",
      "Provide attentive and courteous service, ensuring guest satisfaction.",
      "Clear tables promptly and maintain cleanliness in the dining area.",
      "Work collaboratively with kitchen and restaurant staff to ensure smooth service.",
      "Adhere to safety and hygiene standards at all times.",
      "Handle guest inquiries or requests with professionalism and escalate issues as needed.",
      "Maintain a positive attitude and contribute to a welcoming dining atmosphere."
    ],
    minRequirements: [
      "Fluency in conversational English and excellent communication skills.",
      "Previous experience in a restaurant or hospitality environment is a plus but not required.",
      "Ability to work in a team-oriented, fast-paced environment.",
      "Strong attention to detail and a commitment to cleanliness and organization.",
      "Willingness to learn and take direction from senior staff.",
      "A friendly and approachable demeanor with a passion for guest service."
    ],
    req: "Requirement",
    sideHead: [
      "Team Player",
      "Guest Service Skills",
      "Attention to Detail",
      "Communication Proficiency",
      "Willingness to Learn"
    ],
    sideDesc: [
      "Work effectively with colleagues to deliver seamless dining service.",
      "Demonstrate excellent guest interaction skills and provide a warm dining experience.",
      "Maintain cleanliness and organization in all areas of responsibility.",
      "Fluency in English for clear and courteous communication.",
      "Open to feedback and eager to develop your skills in the hospitality industry."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/lead-navigater.jpg",
    jobTag: "Guest Service",
    jobTitle: "Lead Navigator",
    shortDesc:
      "Take the helm as a Lead Navigator, ensuring the ship’s safe passage and leading the navigation team to deliver a seamless and efficient journey at sea.",
    longDesc: [
      "As a Lead Navigator, you’ll play a pivotal role in the safe and efficient navigation of the vessel, collaborating with the ship’s officers and crew to chart and execute the most optimal routes.",
      "Your responsibilities will include monitoring navigational systems, ensuring compliance with maritime regulations, and leading a team of navigators to deliver precise and effective guidance.",
      "This role is ideal for experienced maritime professionals who are detail-oriented, have excellent leadership abilities, and are passionate about ensuring the safety and efficiency of ship operations."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Plan, monitor, and execute navigation strategies to ensure the safe and efficient operation of the vessel.",
      "Collaborate with the Captain and other officers to determine optimal routes and schedules.",
      "Maintain up-to-date knowledge of maritime regulations, weather patterns, and navigational charts.",
      "Operate and oversee the use of advanced navigational systems and instruments.",
      "Lead and mentor the navigation team, ensuring a high standard of professionalism and efficiency.",
      "Conduct regular training and drills to maintain the crew’s readiness for emergency scenarios.",
      "Prepare and maintain detailed navigation logs and reports.",
      "Ensure strict adherence to safety and environmental standards at all times."
    ],
    minRequirements: [
      "Proven experience in maritime navigation, with a minimum of 5 years in a similar role.",
      "Extensive knowledge of maritime regulations, navigational systems, and safety protocols.",
      "Strong leadership and team management skills.",
      "Excellent problem-solving and decision-making abilities under pressure.",
      "Fluency in English with strong communication and interpersonal skills.",
      "Relevant certifications and licenses as per maritime industry standards.",
      "Experience working with modern navigation tools and technology is highly preferred."
    ],
    req: "Requirement",
    sideHead: [
      "Maritime Expertise",
      "Leadership Skills",
      "Technical Proficiency",
      "Safety Compliance",
      "Problem-Solving Abilities"
    ],
    sideDesc: [
      "Demonstrated experience and expertise in ship navigation and operations.",
      "Proven ability to lead and inspire a team of navigators.",
      "Advanced proficiency in using modern navigational systems and tools.",
      "In-depth knowledge of maritime safety standards and regulations.",
      "Exceptional decision-making skills in dynamic and high-pressure environments."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/events-guest-service.jpg",
    jobTag: "Guest Service",
    jobTitle: "PCL - Events & Guest Service Supervisor",
    shortDesc:
      "Step into the role of Events & Guest Service Supervisor, where you'll oversee event execution and guest service operations, ensuring unforgettable experiences at sea.",
    longDesc: [
      "As an Events & Guest Service Supervisor, you’ll take charge of coordinating and managing events while ensuring impeccable guest service. You’ll act as the link between guests and shipboard teams, ensuring smooth operations and exceptional experiences.",
      "From planning special events to handling guest inquiries, your leadership will set the standard for excellence onboard. You'll oversee service delivery, foster collaboration among departments, and ensure guests leave with lasting memories.",
      "If you’re a detail-oriented leader with a flair for hospitality and event planning, this is your chance to shine while exploring the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Plan and oversee the execution of events, ensuring they meet the highest standards of quality and guest satisfaction.",
      "Act as the primary point of contact for event-related inquiries and resolve guest concerns promptly and professionally.",
      "Collaborate with various shipboard departments to ensure seamless coordination for events and guest services.",
      "Manage schedules and resources to meet the needs of planned activities while maintaining operational efficiency.",
      "Monitor guest feedback and implement improvements to elevate the overall guest experience.",
      "Train and mentor guest service teams, ensuring exceptional service delivery and professionalism.",
      "Adhere to shipboard safety protocols and uphold the company’s standards for hospitality.",
      "Maintain accurate records of events, guest feedback, and service metrics for future enhancements."
    ],
    minRequirements: [
      "Fluency in English with exceptional communication and interpersonal skills.",
      "Proven experience in event planning, hospitality, or guest service roles.",
      "Demonstrated leadership abilities and team management experience.",
      "Strong organizational skills and the ability to multitask effectively in a dynamic environment.",
      "A positive attitude and commitment to delivering outstanding guest experiences.",
      "Proficiency in using scheduling, event management, or reservation systems is highly desirable.",
      "Flexibility to work long hours, including evenings, weekends, and holidays."
    ],
    req: "Requirement",
    sideHead: [
      "Event Coordination Expertise",
      "Guest Service Leadership",
      "Communication Skills",
      "Organizational Excellence",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "Experience in planning, coordinating, and managing events of varying sizes.",
      "Ability to lead and inspire a team to deliver exceptional guest service.",
      "Fluency in English with a professional demeanor and effective communication skills.",
      "Strong attention to detail and the ability to manage multiple priorities simultaneously.",
      "Proactive approach with a positive mindset to ensure guest satisfaction."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/general-manager.jpg",
    jobTag: "Guest Service",
    jobTitle: "PCL - Hotel General Manager",
    shortDesc:
      "Embark on your shipboard career as a Concierge, where you'll provide personalized guest services, ensuring a seamless and exceptional dining and hospitality experience at sea.",
    longDesc: [
      "Join the team as a Concierge and play a key role in creating unforgettable guest experiences onboard. As the go-to person for dining reservations, special requests, and personalized services, you’ll ensure every guest’s needs are met with care and professionalism.",
      "Your role involves collaborating with various departments to provide smooth service, from arranging special dining experiences to managing guest inquiries. As a Concierge, you’ll help set the tone for luxury and hospitality, leaving lasting impressions.",
      "If you’re organized, approachable, and passionate about delivering high-quality service, this role is your opportunity to excel while traveling the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Welcome guests warmly and provide them with detailed information about dining and onboard services.",
      "Assist guests with restaurant reservations and accommodate special requests for dietary preferences or celebrations.",
      "Coordinate with restaurant teams to ensure seamless service delivery and guest satisfaction.",
      "Manage guest inquiries professionally, offering prompt and accurate solutions.",
      "Ensure a high level of organization and communication between departments to handle guest needs effectively.",
      "Offer personalized recommendations for dining options and onboard activities.",
      "Handle complaints or issues diplomatically and escalate them to supervisors when necessary.",
      "Maintain accurate records of guest preferences and feedback to enhance future services.",
      "Adhere to shipboard safety protocols and company standards at all times."
    ],
    minRequirements: [
      "Fluency in conversational English with excellent communication and interpersonal skills.",
      "Previous experience in hospitality, customer service, or front-of-house roles is highly desirable.",
      "Strong organizational skills and attention to detail.",
      "Ability to work in a fast-paced environment with flexibility in working hours.",
      "A warm, professional demeanor and a passion for guest satisfaction.",
      "Experience with reservation or booking systems is a plus but not required."
    ],
    req: "Requirement",
    sideHead: [
      "Experience Level",
      "Guest Service Expertise",
      "Communication Skills",
      "Organizational Abilities",
      "Can-Do Attitude"
    ],
    sideDesc: [
      "Previous hospitality or customer service experience is preferred.",
      "Demonstrate excellent skills in handling guest interactions and requests.",
      "Fluency in English for clear and professional communication.",
      "Ability to multitask and manage multiple guest needs efficiently.",
      "Positive mindset and willingness to go the extra mile for guest satisfaction."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/chef.jpg",
    jobTag: "Galley",
    jobTitle: "Executive Chef",
    shortDesc:
      "Step into the role of Executive Chef, where you'll lead a talented culinary team in creating exceptional dining experiences onboard, ensuring world-class cuisine for every guest.",
    longDesc: [
      "As the Executive Chef, you will be responsible for overseeing all culinary operations onboard, from menu development to food preparation and presentation. You’ll lead a team of skilled chefs to deliver high-quality dishes that delight our guests and reflect our commitment to excellence.",
      "Your role will involve managing inventory, maintaining food safety standards, and collaborating with other departments to ensure smooth galley operations. You’ll also train and mentor your team, fostering a culture of creativity, professionalism, and teamwork.",
      "This is your chance to showcase your culinary expertise, innovate menus, and lead a dynamic team while exploring the world."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Oversee all galley operations, ensuring the preparation and presentation of high-quality dishes.",
      "Develop and innovate menus to cater to diverse guest preferences and dietary requirements.",
      "Lead, train, and motivate the culinary team, fostering a professional and collaborative environment.",
      "Monitor food inventory and ensure cost-effective usage without compromising quality.",
      "Ensure compliance with food safety and sanitation standards at all times.",
      "Collaborate with other departments to ensure seamless service and guest satisfaction.",
      "Manage kitchen schedules, allocate resources effectively, and oversee staff performance.",
      "Handle guest feedback related to dining and make necessary improvements to enhance the experience.",
      "Stay updated on culinary trends and implement them to elevate the dining experience onboard."
    ],
    minRequirements: [
      "Extensive experience in culinary arts, preferably in a leadership role within high-end restaurants, resorts, or cruise lines.",
      "Strong knowledge of international cuisine, food safety regulations, and kitchen operations.",
      "Proven ability to manage and inspire a large culinary team in a fast-paced environment.",
      "Exceptional organizational and time management skills.",
      "Fluency in English with excellent communication and leadership abilities.",
      "Flexibility to work long hours and adapt to a dynamic work environment onboard.",
      "Formal culinary training or certification is highly desirable."
    ],
    req: "Requirement",
    sideHead: [
      "Culinary Leadership",
      "Creativity in Cuisine",
      "Team Management",
      "Food Safety Expertise",
      "Guest-Centric Approach"
    ],
    sideDesc: [
      "Proven experience leading a team of chefs and managing kitchen operations.",
      "Ability to craft innovative menus that cater to a wide range of tastes.",
      "Strong leadership skills to inspire and motivate the culinary team.",
      "Extensive knowledge of food safety standards and procedures.",
      "A focus on delivering exceptional dining experiences that exceed guest expectations."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/bartender2.jpg",
    jobTag: "Beverage",
    jobTitle: "Good Spirits Bartender",
    shortDesc:
      "Join the team as a Good Spirits Bartender and craft unforgettable moments by delivering exceptional cocktails, personalized service, and unique beverage experiences at sea.",
    longDesc: [
      "Step into the role of a Good Spirits Bartender and become the star of our onboard beverage experience. You’ll not only craft premium cocktails but also share the stories and inspirations behind them, creating a vibrant and engaging atmosphere for guests.",
      "As a Good Spirits Bartender, you’ll provide world-class service, recommending signature beverages and offering a personalized touch that ensures every guest feels special. Your role involves more than just mixing drinks; it’s about delivering an unforgettable bar experience.",
      "If you’re creative, energetic, and passionate about mixology, this is your chance to shine while traveling to incredible destinations."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Create and serve a wide range of cocktails, mocktails, and beverages with precision and creativity.",
      "Engage with guests by explaining the origins and ingredients of signature drinks to enhance their experience.",
      "Provide exceptional and personalized guest service, making beverage recommendations based on preferences.",
      "Maintain cleanliness and organization of the bar, ensuring compliance with hygiene and safety standards.",
      "Monitor inventory levels, replenish supplies, and ensure the bar is fully stocked at all times.",
      "Collaborate with other team members to support smooth service operations in all beverage outlets.",
      "Upsell premium beverages and promote bar-specific promotions and events.",
      "Handle guest feedback and resolve issues professionally to maintain satisfaction.",
      "Stay up-to-date on beverage trends and incorporate them into the menu to keep offerings fresh and exciting."
    ],
    minRequirements: [
      "Previous experience as a bartender or in a mixology role, ideally in a high-volume or luxury setting.",
      "Strong knowledge of spirits, wines, beers, and cocktails, with a passion for beverage creativity.",
      "Exceptional guest service and interpersonal skills, with the ability to engage guests in a lively and professional manner.",
      "Fluency in English and excellent communication skills.",
      "Ability to multitask in a fast-paced environment while maintaining attention to detail.",
      "Formal training or certification in mixology is a plus but not required.",
      "Flexibility to work evenings, weekends, and long hours while at sea."
    ],
    req: "Requirement",
    sideHead: [
      "Bartending Experience",
      "Creativity in Mixology",
      "Guest Engagement",
      "Beverage Knowledge",
      "Team Spirit"
    ],
    sideDesc: [
      "Proven experience in bartending or mixology, ideally in a fast-paced or luxury setting.",
      "A passion for crafting unique and creative cocktails to elevate guest experiences.",
      "Ability to engage guests, creating a warm and vibrant atmosphere at the bar.",
      "Strong knowledge of beverages, including cocktails, wines, and spirits.",
      "Collaboration and teamwork to support the overall beverage service onboard."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  },
  %{
    imgRef: "/images/updates/photomanager.jpg",
    jobTag: "Photo Department",
    jobTitle: "Photo Manager",
    shortDesc:
      "Take charge of creating lasting memories as a Photo Manager, leading a team to deliver exceptional photography services and onboard experiences for guests.",
    longDesc: [
      "Join the team as a Photo Manager and oversee all aspects of photography operations onboard, ensuring guests leave with cherished memories. From managing a dynamic team of photographers to delivering outstanding photo products, your leadership will play a key role in enhancing guest satisfaction.",
      "Your role will involve planning and executing photography opportunities at key events, managing photo galleries, and meeting revenue targets while maintaining high service standards.",
      "If you’re a creative leader with strong organizational skills and a passion for photography, this position offers an exciting opportunity to combine your talents with world travel."
    ],
    btn: "Apply Now",
    heading: ["Position Functions:", "Position Minimum Requirements:"],
    Roles: [
      "Lead and motivate the photo department team to provide top-quality photography and exceptional service to guests.",
      "Coordinate photography schedules for key shipboard events, activities, and scenic moments.",
      "Oversee the setup and maintenance of photo galleries, ensuring efficient operations and an inviting atmosphere for guests.",
      "Drive sales of photography packages and related products to meet or exceed revenue targets.",
      "Ensure consistent quality control across all photographs and guest interactions.",
      "Provide training and coaching to the photography team to maintain high service and technical standards.",
      "Collaborate with other departments to organize and promote photography opportunities.",
      "Resolve guest inquiries or concerns related to photography products with professionalism and efficiency.",
      "Adhere to shipboard safety and operational protocols while managing photo equipment and facilities."
    ],
    minRequirements: [
      "Proven experience in photography, preferably in a leadership or managerial role.",
      "Strong organizational and multitasking abilities to manage schedules, team dynamics, and guest interactions effectively.",
      "Fluency in English with excellent communication and interpersonal skills.",
      "Previous sales or retail experience, with the ability to drive revenue through photography services.",
      "Proficiency in photo editing software (e.g., Adobe Photoshop or Lightroom) is highly desirable.",
      "A creative mindset with a strong eye for detail in photography and presentation.",
      "Ability to work flexible hours in a fast-paced, dynamic environment.",
      "Experience working onboard ships or in hospitality settings is a plus."
    ],
    req: "Requirement",
    sideHead: [
      "Photography Expertise",
      "Leadership Skills",
      "Sales and Revenue Focus",
      "Guest Interaction Abilities",
      "Creativity and Attention to Detail"
    ],
    sideDesc: [
      "Proven technical skills in photography and editing software.",
      "Strong leadership experience in managing teams and operations.",
      "Focus on achieving revenue targets through strategic planning and guest engagement.",
      "Exceptional interpersonal skills to handle guest interactions professionally.",
      "A creative approach to capturing and presenting high-quality images."
    ],
    sideLogo: [
      "/images/req/req1.png",
      "/images/req/req2.png",
      "/images/req/req3.png",
      "/images/req/req4.png",
      "/images/req/req5.png"
    ]
  }
]

Enum.each(jobs, fn job ->
  changeset = Job.changeset(%Job{}, job)
  Repo.insert!(changeset)
end)
