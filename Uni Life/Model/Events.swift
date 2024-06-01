
import UIKit
import SwiftUI


enum Category : String{
    case concerti, mostre, manifestazioni, conferenze, gite, feste
}

class Eventi: Identifiable {
    
    let id = UUID().uuidString
    var title : String
    var category : String //category
    var description : String
    var price : Int
    var date : String
    var hour : String
    var location : String
    var favourite : Bool = false
    var organization : String
    var address : String
    var capacity : Int
    var currentCapacity : Int = 0
    var booked: Bool = false
    var imageName : String
    var alert: Bool = false

    init(title: String, category:String,  description:String,  price:Int,  date:String,  hour:String,  location:String,  organization:String, address:String,  capacity: Int,  imageName:String, favourite: Bool = false, alert: Bool = false){
    
        self.title = title
        self.category = category //category
        self.description = description
        self.price = price
        self.date = date
        self.hour = hour
        self.location = location
        self.organization = organization
        self.address = address
        self.capacity = capacity
        self.imageName = imageName
        self.favourite = favourite
        self.alert = alert
    }
    
}


class Reddit: Identifiable{
    let id = UUID().uuidString
    var category: Category.RawValue
    var text: String
    var number: Int
    var isUp: Bool
    var isDown: Bool
    var isMine: Bool
    var myTab: Bool
    
    init(category: String, text: String, number: Int = 0,isUp: Bool = false, isDown: Bool = false, isMine: Bool = false,myTab: Bool = false, alert: Bool = false){
        self.category = category
        self.text = text
        self.number = number
        self.isUp = isUp
        self.isDown = isDown
        self.isMine = isMine
        self.myTab = myTab
    }
}

class Spot: Identifiable{
    let id = UUID()
    var message: String
    var event: String
    var isMine: Bool
    var iam: Bool
    
    init(message: String, event: String, isMine: Bool = false, iam: Bool = false)
    {
        self.message = message
        self.event = event
        self.isMine = isMine
        self.iam = iam
    }
}
    
struct CategoryCard: Identifiable{
    var id = UUID()
    var category: Category.RawValue //category
    
    var color: Color
    var image: String
}

//struct Spot: Identifiable{
//    let id = UUID()
//    var message: String
//    var event: String
//}
    


var reddits = [

        Reddit(category: "Parties", text: "I propose an outdoor aperitif in the square in front of the building",number: 100),
        Reddit(category: "Exhibitions", text: "I recommend seeing the exhibition of Monet",number:80,isMine: true),
        Reddit(category: "Trips", text: "I would like to go on a trip to the mountains with a group of interested people",number: 15),
        Reddit(category: "Games", text: "I propose a board game evening", number: 10),
        Reddit(category: "Sports", text: "I propose that we can go ski together")
]

var endEvents = [
    Eventi(title: "BCN Disco", category: "Parties", description: "Party organized for the last day of lessons, where you can dance outdoors with DJ Set", price: 15, date: "15 Jun", hour: "19:00", location: "Barcelona", organization: "Party Club", address: "Carrer de Jordi Girona, 1", capacity: 200, imageName: "party"),
    Eventi(title: "Picasso Exhibition", category: "Exhibitions", description: "Exhibition", price: 10, date: "20 Jun", hour: "10:00", location: "Picasso Museum", organization: "Museum Club", address: "C/ de Montcada, 15", capacity: 100, imageName: "maxxi"),
    Eventi(title: "Discover Barcelona", category: "Trips", description: "Trip", price: 0, date: "1 Jul", hour: "19:00", location: "Plaça de Catalunya", organization: "Student Club", address: "Plaça de Catalunya", capacity: 0, imageName: "Rome"),
    Eventi(title: "Silent Disco", category: "Parties", description: "Silent Disco", price: 15, date: "17 Jun", hour: "19:00", location: "Plaça d'Espanya", organization: "Party Club", address: "Plaça d'Espanya", capacity: 100, imageName: "silentdisco"),

]

var spots = [
   Spot(message: "I really like the music and happy people there", event: "BCN Disco",isMine: true),
   Spot(message: "I met someone who understands Picasso a lot and listened to interesting stories", event: "Picasso Exhibition"),
   Spot(message: "I met a handsome boy and we dance all night", event: "BCN Disco"),
   Spot(message: "I saw the girl who was singing the songs with me without headphones hahaha, let's have a coffee if you like", event: "Silent Disco",isMine: true),
   Spot(message: "I talked about Physics with someone", event: "Silent Disco"),
   Spot(message: "I saw the group of volleyball", event: "Discover Barcelona")

    ]

var myspots = [
    Spot(message: "I met someone who understands Picasso a lot and listened to interesting stories", event: "Picasso Exhibition")
]

var categories = [
    
    "Conferences", "Concerts", "Trips", "Exhibitions", "Parties", "Processions", "Sports", "Health", "Openings", "Games"]

var categoris = [
    CategoryCard(category: "Openings", color: .yellow, image: "scissors"),
    CategoryCard(category: "Conferences", color: .purple, image: "person.3"),
    CategoryCard(category: "Concerts", color: .blue, image: "music.mic"),
    CategoryCard(category: "Processions", color: Color(#colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)), image: "megaphone"),
    CategoryCard(category: "Parties", color: .red, image: "hifispeaker.2"),
    CategoryCard(category: "Games", color: Color(#colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)), image: "die.face.2"),
    CategoryCard(category: "Trips", color: .green, image: "map"),
    CategoryCard(category: "Exhibitions", color: .orange, image: "paintpalette"),
    CategoryCard(category: "Health", color: .green, image: "waveform.path.ecg"),
    CategoryCard(category: "Sports", color: .blue, image: "figure.walk")

]




var eventis = [

    
    Eventi(title: "Quiz night", category: "Games", description: "Come along to the quiz night where you can win prizes", price: 5, date: "24 Feb", hour: "22:00", location: "UPC", organization: "UPC Quiz Club", address: "Carrer de Jordi Girona, 1", capacity: 50, imageName: "quiz"),
    Eventi(title: "Let's party", category: "Parties", description: "I promise this is the greatest party in Barcelona", price: 0, date: "20 Dec", hour: "9:00", location: "Good Party Place", organization: "Party Club", address: "Plaça d'Espanya", capacity: 200, imageName: "party"),
    Eventi(title: "IT Meeting", category: "Conferences", description: "Come to the IT Meeting to get to know the companies that work in the IT field", price: 0, date: "20 Dec", hour: "9:00", location: "Plaça d'Espanya", organization: "IT Department", address: "Plaça d'Espanya", capacity: 200, imageName: "ITMeeting"),
    Eventi(title: "Mountain trip", category: "Trips", description: "Trip to the mountains with a group of experts who will make you explore wonderful places.", price: 15, date: "2 Mar", hour: "8:00", location: "Montserrat", organization: "Hiking Org", address: "Montserrat", capacity: 40, imageName: "gita"),
    Eventi(title: "Opening for Physics club", category: "Openings", description: "Celebrate the opening of Physics club", price: 0, date: "10 Dec", hour: "11:00", location: "Zona Universitaria", organization: "UPC", address: "Zona Universitaria", capacity: 100, imageName: "Cabibbo"),
    
    Eventi(title: "Christmas concert", category: "Concerts", description: "Christmas concert played by the orchestra", price: 0, date: "24 Dec", hour: "21:00", location: "Collblanc", organization: "City council", address: "Collblanc", capacity: 100, imageName: "Orchestra"),

    Eventi(title: "Disco", category: "Parties", description: "I'm sure you will love this disco", price: 0, date: "24 Dec", hour: "21:00", location: "Collblanc", organization: "City council", address: "Collblanc", capacity: 100, imageName: "silentdisco"),
    
    Eventi(title: "Plastic Free World", category: "Processions", description: "Help save the planet too, or at least make your contribution. We are an organization that I know brings together to clean the beaches of plastic. Many animals eat this plastic or get stuck in it, preventing their movements. Save the Planet", price: 0, date: "15 Mar", hour: "10:00", location: "La Rambla", organization: "Save the planet", address: "La Rambla, 1", capacity: 1000, imageName: "plasticfree"),
    Eventi(title: "Apple Conference", category: "Conferences", description: "Tim Cook comes to wisdom to discuss how important knowledge is and how it has changed people's lives in this last decade", price: 0, date: "25 Feb", hour: "9:30", location: "Palo Alto", organization: "Apple", address: "Palo Alto", capacity: 200, imageName: "Apple"),
    Eventi(title: "Donate blood", category: "Health", description: "Donate blood too, you can save lives", price: 0, date: "26 Feb", hour: "10:00", location: "UPC", organization: "UPC", address: "UPC", capacity: 2000, imageName: "sangue-1"),
    Eventi(title: "Gaudi", category: "Exhibitions", description: "Gaudi Exhibitions", price: 15, date: "14 Dec", hour: "10:00", location: "Casa Batlló", organization: "UPC", address: "UPC", capacity: 70, imageName: "banksy2"),
    Eventi(title: "Laser Party", category: "Parties", description: "Laser game waiting for you", price: 15, date: "14 Dec", hour: "10:00", location: "Casa Batlló", organization: "UPC", address: "UPC", capacity: 70, imageName: "aperitivo"),
    Eventi(title: "Red Hot Chilli Peppers", category: "Concerts", description: "Concert at the stadium.", price: 50, date:"28 Mar", hour: "19:00", location: "Stadium", organization: "Concert Org", address: "Stadium", capacity: 10000, imageName: "Rhcp"),
    Eventi(title: "Prof meeting", category: "Conferences", description: "Prof will come and tell us about him", price: 0, date: "1 May", hour: "11:00", location: "UPC", organization: "UPC", address: "UPC", capacity: 100, imageName: "Salvatore"),
    

    
    Eventi(title: "Football tournament", category: "Sports", description: "Football tournament with prizes", price: 10, date: "24 May", hour: "14:00", location: "Sports center", organization: "Sports center", address: "Sports center", capacity: 20, imageName: "Calcio"),
    Eventi(title: "Let's get vaccinated", category: "Health", description: "Request the vaccine through public health service", price: 0, date: "25 Jan", hour: "11:00", location: "UPC", organization: "UPC", address: "UPC", capacity: 1000, imageName: "vaccino"),
    Eventi(title: "Monet", category: "Exhibitions", description: "Monet Exhibitions", price: 15, date: "27 Mar", hour: "10:00", location: "BCN", organization: "BCN", address: "BCN", capacity: 200, imageName: "monet"),
    
    Eventi(title: "Mozart over time", category: "Concerts", description: "The orchestra will play for us the best pieces of the composer who changed the history of music, reliving the journey of the young composer, up to the last days of his life", price: 15, date: "27 Sep", hour: "21:00", location: "Palau de la Música Catalana", organization: "Palau de la Música Catalana", address: "Palau de la Música Catalana", capacity: 100, imageName: "Mozart"),
    
    Eventi(title: "Elon Musk", category: "Conferences", description: "Elon Musk will talk about SpaceX", price: 0, date: "3 May", hour: "10:00", location: "Online", organization: "SpaceX", address: "Online", capacity: 100, imageName: "ElonMusk")
]


var new_eventis = [
    Eventi(title: "Disco", category: "Parties", description: "I'm sure you will love this disco", price: 0, date: "24 Dec", hour: "21:00", location: "Collblanc", organization: "City council", address: "Collblanc", capacity: 100, imageName: "silentdisco"),
    Eventi(title: "Laser Party", category: "Parties", description: "Laser game waiting for you", price: 15, date: "14 Dec", hour: "10:00", location: "Casa Batlló", organization: "UPC", address: "UPC", capacity: 70, imageName: "aperitivo"),
    Eventi(title: "Quiz night", category: "Games", description: "Come along to the quiz night where you can win prizes", price: 5, date: "24 Feb", hour: "22:00", location: "UPC", organization: "UPC Quiz Club", address: "Carrer de Jordi Girona, 1", capacity: 50, imageName: "quiz"),
    Eventi(title: "Football tournament", category: "Sports", description: "Football tournament with prizes", price: 10, date: "24 May", hour: "14:00", location: "Sports center", organization: "Sports center", address: "Sports center", capacity: 20, imageName: "Calcio"),
    Eventi(title: "Red Hot Chilli Peppers", category: "Concerts", description: "Concert at the stadium.", price: 50, date:"28 Mar", hour: "19:00", location: "Stadium", organization: "Concert Org", address: "Stadium", capacity: 10000, imageName: "Rhcp"),
    Eventi(title: "Mountain trip", category: "Trips", description: "Trip to the mountains with a group of experts who will make you explore wonderful places.", price: 15, date: "2 Mar", hour: "8:00", location: "Montserrat", organization: "Hiking Org", address: "Montserrat", capacity: 40, imageName: "gita"),
    Eventi(title: "Let's get vaccinated", category: "Health", description: "Request the vaccine through public health service", price: 0, date: "25 Jan", hour: "11:00", location: "UPC", organization: "UPC", address: "UPC", capacity: 1000, imageName: "vaccino"),
    Eventi(title: "Monet", category: "Exhibitions", description: "Monet Exhibitions", price: 15, date: "27 Mar", hour: "10:00", location: "BCN", organization: "BCN", address: "BCN", capacity: 200, imageName: "monet"),
    
    Eventi(title: "Mozart over time", category: "Concerts", description: "The orchestra will play for us the best pieces of the composer who changed the history of music, reliving the journey of the young composer, up to the last days of his life", price: 15, date: "27 Sep", hour: "21:00", location: "Palau de la Música Catalana", organization: "Palau de la Música Catalana", address: "Palau de la Música Catalana", capacity: 100, imageName: "Mozart"),
    
    Eventi(title: "Elon Musk", category: "Conferences", description: "Elon Musk will talk about SpaceX", price: 0, date: "3 May", hour: "10:00", location: "Online", organization: "SpaceX", address: "Online", capacity: 100, imageName: "ElonMusk"),
    Eventi(title: "Plastic Free World", category: "Processions", description: "Help save the planet too, or at least make your contribution. We are an organization that I know brings together to clean the beaches of plastic. Many animals eat this plastic or get stuck in it, preventing their movements. Save the Planet", price: 0, date: "15 Mar", hour: "10:00", location: "La Rambla", organization: "Save the planet", address: "La Rambla, 1", capacity: 1000, imageName: "plasticfree"),
    Eventi(title: "Apple Conference", category: "Conferences", description: "Tim Cook comes to wisdom to discuss how important knowledge is and how it has changed people's lives in this last decade", price: 0, date: "25 Feb", hour: "9:30", location: "Palo Alto", organization: "Apple", address: "Palo Alto", capacity: 200, imageName: "Apple"),
    Eventi(title: "Donate blood", category: "Health", description: "Donate blood too, you can save lives", price: 0, date: "26 Feb", hour: "10:00", location: "UPC", organization: "UPC", address: "UPC", capacity: 2000, imageName: "sangue-1"),
    Eventi(title: "Gaudi", category: "Exhibitions", description: "Gaudi Exhibitions", price: 15, date: "14 Dec", hour: "10:00", location: "Casa Batlló", organization: "UPC", address: "UPC", capacity: 70, imageName: "banksy2")
]
