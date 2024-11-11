//
//  TaskService.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 03.11.2024.
//

import UIKit

class TaskService {
    
    private init() {
        loadCompletedTasks()
    }
    static let shared = TaskService()
    
    private let completedTasksKey = "completedTasksKey"
    private let buttonTextsKey = "buttonTextsKey"
    
    var tasks = [
        TasksStorage(day: "Day 1", image: "day1", task: "Decorate a room with fairy lights or garlands – bring some holiday sparkle"),
        TasksStorage(day: "Day 2", image: "day2", task: "Make paper snowflakes and hang them on windows or the Christmas tree"),
        TasksStorage(day: "Day 3", image: "day3", task: "Create a Christmas wreath using natural materials or festive decorations"),
        TasksStorage(day: "Day 4", image: "day4", task: "Make a holiday card for someone special – add a personal, heartfelt message"),
        TasksStorage(day: "Day 5", image: "day5", task: "Write down your New Year’s wishes and put them in a “magic” wish box"),
        TasksStorage(day: "Day 6", image: "day6", task: "Bake gingerbread cookies and decorate them with icing"),
        TasksStorage(day: "Day 7", image: "day7", task: "Make a cozy hot chocolate with marshmallows – don’t forget a festive mug!"),
        TasksStorage(day: "Day 8", image: "day8", task: "Try a new recipe for a dessert or holiday dish that you haven’t tasted before"),
        TasksStorage(day: "Day 9", image: "day9", task: "Put together a small holiday treat bag and gift it to someone to lift their spirits"),
        TasksStorage(day: "Day 10", image: "day10", task: "Make a homemade mulled wine or a fruity non-alcoholic holiday drink"),
        TasksStorage(day: "Day 11", image: "day11", task: "Write a letter to Santa (or just for fun) – share your wishes and dreams"),
        TasksStorage(day: "Day 12", image: "day12", task: "Share homemade treats with neighbors or colleagues – spread holiday joy"),
        TasksStorage(day: "Day 13", image: "day13", task: "Plan a day of good deeds and do something kind for those around you"),
        TasksStorage(day: "Day 14", image: "day14", task: "Prepare small presents for loved ones to show you’re thinking of them"),
        TasksStorage(day: "Day 15", image: "day15", task: "Write warm holiday messages to friends or family and send out cards"),
        TasksStorage(day: "Day 16", image: "day16", task: "Watch a holiday movie or cartoon – perhaps “Home Alone” or “The Polar Express.”"),
        TasksStorage(day: "Day 17", image: "day17", task: "Create a holiday playlist with your favorite songs and carols"),
        TasksStorage(day: "Day 18", image: "day18", task: "Have a festive photo shoot by the Christmas tree or with holiday decorations"),
        TasksStorage(day: "Day 19", image: "day19", task: "Organize a game night or a Christmas-themed trivia session with friends or family"),
        TasksStorage(day: "Day 20", image: "day20", task: "Write down your favorite memories from this year and think about your hopes for the next"),
        TasksStorage(day: "Day 21", image: "day21", task: "Decorate the holiday table and try a new table setting"),
        TasksStorage(day: "Day 22", image: "day22", task: "Trim the Christmas tree with family or friends – add lights, ornaments, and ribbons"),
        TasksStorage(day: "Day 23", image: "day23", task: "Take a stroll through a holiday market or around the city – soak in the festive vibes"),
        TasksStorage(day: "Day 24", image: "day24", task: "Wrap gifts with care and add ribbons or personal touches."),
        TasksStorage(day: "Day 25", image: "day25", task: "Make wishes for the New Year and spend time with your closest loved ones")
    ]
    
    var completedTasks: [TasksStorage] = [] {
        didSet {
            saveCompletedTasks()
        }
    }
    
    var buttonTexts: [String: String] = [:] {
        didSet {
            saveButtonTexts()
        }
    }
    
    private func saveCompletedTasks() {
        let tasksData = completedTasks.map { task in
            ["day": task.day, "image": task.image ?? "", "task": task.task]
        }
        UserDefaults.standard.set(tasksData, forKey: completedTasksKey)
    }
    
    private func loadCompletedTasks() {
        guard let savedTasks = UserDefaults.standard.array(forKey: completedTasksKey) as? [[String: Any]] else { return }
        completedTasks = savedTasks.compactMap { dict in
            guard let day = dict["day"] as? String,
                  let image = dict["image"] as? String,
                  let task = dict["task"] as? String else { return nil }
            return TasksStorage(day: day, image: image, task: task)
        }
    }
    
    private func saveButtonTexts() {
        UserDefaults.standard.set(buttonTexts, forKey: buttonTextsKey)
    }
    
    private func loadButtonTexts() {
        if let savedButtonTexts = UserDefaults.standard.dictionary(forKey: buttonTextsKey) as? [String: String] {
            buttonTexts = savedButtonTexts
        }
    }
    
}
