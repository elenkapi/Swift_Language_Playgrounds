import Foundation

/* დავალება #2
 
 შექმენით ბლოგერის კლასი, რომელსაც აქვს:
 მის მიერ შექმნილი პოსტების ჩამონათვალი.
 პოსტები შეიძლება ერთზე მეტ კატეგორიას მოიცავდნენ.
 თითოეულ პოსტს უნდა ჰქონდეს შეფასება 0-დან 5-ის ჩათვლით.
 ბლოგერს უნდა შეეძლოს გვითხრას, თუ რამდენია მისი პოსტების საშუალო შეფასება.
 რომელია მისი ყველაზე პოპულარული პოსტი.
 თქვენი ამოცანაა შექმნათ კლასი ბლოგერი და სტრუქტურა პოსტი. მინიმუმ ეს ორი, მაგრამ შეიგიძლიათ გამოიყენოთ სხვადასხვა ტიპი, რომლებიც უკეთესი მოდელის შექმნაში დაგეხმარებათ. ვისაც მონაცემთა ბაზებთან ჰქონია შეხება, საუბარია გამართულ რელაციურ მოდელზე. შეგიძლიათ თქვენი ფანტაზიის მიხედვით დაუმატოთ სხვადასხვა ფუნქციები ამა თუ იმ კლასს ან სტუქტურას (ან ენამს).
 
 შექმენით კლასი, რომელიც “მოემსახურება” ბლოგერების კლასს, უნდა შეეძლოს შემდეგ კითხვებზე პასუხი:
 რამდენი ბლოგერია ბლოგზე
 რომელია ყველაზე პოპულარული ბლოგერი
 რომელია ყველაზე პოპულარული პოსტი ბლოგზე
 რამდენია ბლოგზე არსებული პოსტების საშუალო შეფასება
 რომელია ყველაზე ხშირად გამოყენებული პოსტის კატეგორია
 */



enum Category: String {
    case fashion, sport, health
}

class Blogger {
    let posts: [Post]
    
    init(posts: [Post]) {
        self.posts = posts
    }
    
    func avarageRate() -> Double {
        Double(posts.reduce(0) { partialResult, post in
            partialResult + post.rate
        }) / Double(posts.count)
    }
    func mostPopularPost() -> Post? {
        posts.max(by: {$0.rate < $1.rate})
    }

    
}

struct Post {
    let categories: [Category]
    private(set) var rate: Int {
        didSet {
            rate = rate > 5 ? 5 : rate
        }
    }
}

class bloggerManager {
    private let bloggers: [Blogger]
    
    init(bloggers: [Blogger]) {
        self.bloggers = bloggers
    }
    func numberOfbloggers() -> Int {
        bloggers.count
    }
    
    func mostPopularBlogger() -> Blogger? {
        bloggers.max(by: {$0.avarageRate() < $1.avarageRate()})
    }
    
    func mostPopularPostOnBlog() -> Post? {
        bloggers.max(by: {$0.mostPopularPost()?.rate ?? 0 < $1.mostPopularPost()?.rate ?? 0})?.mostPopularPost()
    }
    
    func averageRateOnBlog() -> Double {
        bloggers.reduce(0) { partialResult, blogger in
            partialResult + blogger.avarageRate()
        } / Double(bloggers.count)
    }
    
    func mostUsedCategory() -> Category? {
        var categoryDictionary = [Category: Int]()
        bloggers.forEach { blogger in
            blogger.posts.forEach { post in
                post.categories.forEach { category in
                    if categoryDictionary[category] != nil {
                        categoryDictionary.updateValue(categoryDictionary[category]! + 1, forKey: category)
                    } else {
                        categoryDictionary[category] = 1
                    }
                }
            }
        }
        let maxValue = categoryDictionary.values.max()
        return categoryDictionary.keys.first(where: { categoryDictionary[$0] == maxValue })
    }
}

