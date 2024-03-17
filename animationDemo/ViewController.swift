import UIKit
import Foundation

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(playingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        var cards = [PlayingCardDeck]()
//        for _ in 1...((cardViews.count+1)/2) {
//            let card = deck.draw()!
//            cards+= [card, card]
//        }
//        for cardView in cardViews {
//            cardView.isFaceUp = false
//            let card = cards.remove(at: cards.count.arc4random)
//            cardView.rank = card.rank.order
//            cardView.suit = card.suit.rawValue
//            cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipCard(_:))))
//        }
        
        for _ in 1...10 {
           if let card = deck.draw() {
                print("\(card)")
            }
        }
    }
}

