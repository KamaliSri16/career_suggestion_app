import 'package:flutter/material.dart';

void main() {
  runApp(CareerSuggestionApp());
}

class CareerSuggestionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Suggestion App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.pink[800],
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Find your Dream Career✨',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InterestInputScreen()),
                  );
                },
                child: Text('Start Exploring'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InterestInputScreen extends StatefulWidget {
  @override
  _InterestInputScreenState createState() => _InterestInputScreenState();
}

class _InterestInputScreenState extends State<InterestInputScreen> {
  final TextEditingController _controller = TextEditingController();

  void _suggestCareer() {
    final interest = _controller.text.trim().toLowerCase();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(interest: interest),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(title: Text("What's Your Interest?")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Type your interest (e.g., coding, art)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _suggestCareer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: Text('Suggest Careers'),
            )
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String interest;
  ResultScreen({required this.interest});

  final Map<String, List<String>> keywordCareerMap = {
    "coding": [
      "Software Engineer", "App Developer", "Web Developer", "Data Scientist",
      "Machine Learning Engineer", "AI Researcher", "Cybersecurity Analyst",
      "Game Developer", "DevOps Engineer", "Blockchain Developer",
      "Cloud Architect", "Embedded Systems Engineer", "Database Administrator",
      "UI/UX Designer"
    ],
    "programming": ["Software Engineer", "Backend Developer"],
    "code": ["Software Engineer", "Programmer"],
    "app": ["App Developer", "Mobile Developer"],
    "python": ["Data Scientist", "Backend Developer"],
    "java": ["Software Engineer"],
    "c++": ["Game Developer", "Software Engineer"],
    "c": ["Embedded Systems Engineer"],
    "html": ["Web Developer", "Frontend Developer"],
    "web": ["Web Developer", "UI/UX Designer"],
    "art": [
      "Graphic Designer", "Illustrator", "Animator", "Concept Artist",
      "Fashion Designer", "Interior Designer", "Art Director", "3D Modeler",
      "Tattoo Artist", "Visual Effects Artist", "Motion Graphics Designer"
    ],
    "design": ["Graphic Designer", "Fashion Designer", "Interior Designer"],
    "drawing": ["Illustrator", "Tattoo Artist"],
    "vfx": ["Visual Effects Artist"],
    "3d": ["3D Modeler", "Animator"],
    "animation": ["Animator", "Motion Graphics Designer"],
    "sales": [
      "Sales Manager", "Account Executive", "Business Development Manager",
      "Retail Sales Associate"
    ],
    "marketing": ["Marketing Manager", "Digital Marketer"],
    "retail": ["Retail Sales Associate", "Client Relationship Manager"],
    "business": [
      "Entrepreneur", "Business Analyst", "HR Manager", "Product Manager"
    ],
    "finance": ["Financial Analyst", "Investment Banker"],
    "startup": ["Entrepreneur", "Venture Capitalist"],
    "management": ["Operations Manager", "Project Manager"],
    "science": [
      "Research Scientist", "Chemist", "Biologist", "Physicist",
      "Environmental Scientist", "Astronomer", "Geologist", "Geneticist",
      "Statistician", "Marine Biologist", "Forensic Scientist", "Meteorologist"
    ],
    "biology": ["Biologist", "Marine Biologist"],
    "chemistry": ["Chemist"],
    "physics": ["Physicist"],
    "genes": ["Geneticist"],
    "ocean": ["Marine Biologist"],
    "medical": [
      "Doctor", "Nurse", "Surgeon", "Pharmacist", "Dentist", "Psychologist",
      "Physiotherapist", "Radiologist", "Nutritionist", "Paramedic",
      "Medical Technologist", "Veterinarian", "Occupational Therapist"
    ],
    "medicine": ["Doctor", "Pharmacist"],
    "hospital": ["Nurse", "Surgeon"],
    "health": ["Nutritionist", "Psychologist"],
    "engineering": [
      "Civil Engineer", "Mechanical Engineer", "Electrical Engineer",
      "Electronics Engineer", "Chemical Engineer", "Robotics Engineer",
      "Aerospace Engineer", "Automotive Engineer", "Structural Engineer",
      "Systems Engineer", "Biomedical Engineer"
    ],
    "robotics": ["Robotics Engineer"],
    "engineer": ["Mechanical Engineer", "Software Engineer"],
    "sports": [
      "Athlete", "Cricketer", "Footballer", "Swimmer", "Fitness Trainer",
      "Sports Coach", "Sports Analyst", "Referee", "Sports Psychologist",
      "Personal Trainer", "Gym Owner", "Sports Commentator"
    ],
    "fitness": ["Fitness Trainer", "Personal Trainer"],
    "gym": ["Gym Owner", "Fitness Trainer"],
    "entertainment": [
      "Actor", "Singer", "YouTuber", "Influencer", "Dancer", "Musician",
      "Filmmaker", "Director", "Screenwriter", "Comedian", "Radio Jockey",
      "TV Presenter", "Voice Actor", "Video Editor"
    ],
    "music": ["Singer", "Musician", "Composer", "Music Director"],
    "film": ["Filmmaker", "Director"],
    "dance": ["Dancer", "Choreographer"],
    "writing": [
      "Author", "Content Writer", "Blogger", "Copywriter", "Technical Writer",
      "Editor", "Journalist", "Scriptwriter", "Public Relations Specialist",
      "Communications Manager", "Translator"
    ],
    "author": ["Author"],
    "blogging": ["Blogger"],
    "travel": [
      "Pilot", "Flight Attendant", "Travel Agent", "Tour Guide", "Hotel Manager",
      "Event Planner", "Cruise Staff", "Travel Blogger", "Bartender", "Concierge"
    ],
    "trip": ["Tour Guide", "Travel Agent"],
    "explore": ["Travel Blogger"],
    "lifestyle": [
      "Life Coach", "Career Counselor", "Makeup Artist", "Hairstylist",
      "Fashion Stylist", "Spa Therapist", "Esthetician", "Image Consultant",
      "Personal Shopper", "Wedding Planner"
    ],
    "beauty": ["Makeup Artist", "Esthetician"],
    "makeup": ["Makeup Artist"],
    "fashion": ["Fashion Designer", "Fashion Stylist", "Model"],
    "animals": ["Veterinarian", "Zoologist", "Wildlife Photographer"],
    "space": ["Astronomer", "Astrophysicist", "Space Scientist"],
    "nature": ["Environmentalist", "Botanist", "Marine Biologist"],
    "teaching": ["School Teacher", "Professor", "Corporate Trainer"],
    "law": ["Lawyer", "Legal Advisor", "Judge", "Paralegal"],
    "cars": ["Automotive Engineer", "Race Car Driver", "Mechanic"],
    "social media": ["Influencer", "YouTuber", "Social Media Manager"]
  };

  List<String> getMatchingCareers(String keyword) {
    return keywordCareerMap[keyword] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final careers = getMatchingCareers(interest);
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(title: Text("Suggested Careers")),
      body: careers.isEmpty
          ? Center(child: Text("No careers found for this interest 😢"))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: careers.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 6,
                  shadowColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      careers[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[800],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

