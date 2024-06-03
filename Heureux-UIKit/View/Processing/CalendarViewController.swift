//
//  CalendarViewController.swift
//  Heureux-UIKit
//
//  Created by Treasure Letter on 30/05/2024.
//

import UIKit

class CalendarViewController: UIViewController {
  let calendarView = UICalendarView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    calendarView.calendar = Calendar(identifier: .gregorian)
    calendarView.translatesAutoresizingMaskIntoConstraints = false
    calendarView.locale = Locale(identifier: "vi_VN")
    var dateComponents = DateComponents()
    dateComponents.year = 2024
    dateComponents.month = 1
    dateComponents.day = 1
    calendarView.setVisibleDateComponents(dateComponents, animated: true)
//    calendarView.selectionBehavior = UICalendarSelectionMultiDate(delegate: self)
    
    view.addSubview(calendarView)
    calendarView.delegate = self
    NSLayoutConstraint.activate([
      calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      calendarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    let gregorianCalendar = Calendar(identifier: .gregorian)
    calendarView.calendar = gregorianCalendar
    //    calendarView.locale = Locale(identifier: "zh_TW") // Set the desired locale
    
    
    let fromDateComponents = DateComponents(
      calendar: gregorianCalendar,
      year: 2024,
      month: 1,
      day: 1
    )
    let toDateComponents = DateComponents(
      calendar: gregorianCalendar,
      year: 2024,
      month: 12,
      day: 31
    )
    guard let fromDate = fromDateComponents.date, let toDate = toDateComponents.date else {
      fatalError("Invalid date components")
    }
    let calendarViewDateRange = DateInterval(start: fromDate, end: toDate)
    calendarView.availableDateRange = calendarViewDateRange
  }
}

extension CalendarViewController: UICalendarViewDelegate {
  func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
    // Customize the decoration for specific dates
    if let day = dateComponents.day, let month = dateComponents.month, let year = dateComponents.year {
      if day == 1 && month == 1 && year == 2024 {
        let label = UILabel()
        label.text = "AHIHI"
        label.translatesAutoresizingMaskIntoConstraints = false
        let subView = UIView()
        subView.addSubview(label)
        subView.backgroundColor = .colorPink
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          label.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
          label.centerYAnchor.constraint(equalTo: subView.centerYAnchor)
        ])
        let decoration = UICalendarView.Decoration.customView({return subView})
        return decoration
      }
    }
    return nil
  }
}

//extension CalendarViewController: UICalendarSelectionMultiDateDelegate {
//  func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
//    let gregorianCalendar = Calendar(identifier: .gregorian)
//    var preSelectedDateComponents = DateComponents(calendar: gregorianCalendar)
//    preSelectedDateComponents.year = 2024
//    // Set the desired month and day for pre-selection
//    preSelectedDateComponents.month = 7  // Change this to your desired month (1-12)
//    preSelectedDateComponents.day = 4   // Change this to your desired day (1-31)
//    
//    return preSelectedDateComponents == dateComponents
//  }
//  
//  func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
//    return
//  }
//}
