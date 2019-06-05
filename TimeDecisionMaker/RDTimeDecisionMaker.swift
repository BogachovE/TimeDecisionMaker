//
//  RDTimeDecisionMaker.swift
//  TimeDecisionMaker
//
//  Created by Mikhail on 4/24/19.
//

import Foundation

class RDTimeDecisionMaker: NSObject {
    /// Main method to perform date interval calculation
    ///
    /// - Parameters:
    ///   - organizerICSPath: path to personA file with events
    ///   - attendeeICSPath: path to personB file with events
    ///   - duration: desired duration of appointment
    ///   - isAllDayEventInclude: by default excluding allDay appoitments from calculations WIP
    ///   - slotDistantionStep: step on which appointment can move
    /// - Returns: array of available time slots, empty array if none found
    func suggestAppointments(organizerICS:String,
                             attendeeICS:String,
                             duration:TimeInterval,
                             isAllDayEventInclude: Bool = false,
                             slotDistantionStep: TimeInterval = 3_600) -> [DateInterval] {
        var slots: [DateInterval] = []
        
        do {
            let fileA = try String(contentsOfFile: Bundle.main.path(forResource: "A", ofType: "ics") ?? "")
            let fileB = try String(contentsOfFile: Bundle.main.path(forResource: "B", ofType: "ics") ?? "")
            let organizerCal = try SwiftCal(icsFileContent: fileA)
            let attendeeCall = try SwiftCal(icsFileContent: fileB)
            
            organizerCal.addEvents(attendeeCall)
            if !isAllDayEventInclude { organizerCal.removeAllDays() }
            organizerCal.sort()
            
            for i in 0...organizerCal.allEvents.count - 2 {
                let events = organizerCal.allEvents
                let _slots = findAvalibleSlots(event1: events[i],
                                               event2: events[i+1],
                                               durantion: duration,
                                               slotDistantionStep: slotDistantionStep)
                slots.append(contentsOf: _slots)
                
                if events.count == i+2 {
                    let endEvent = events[i+1]
                    guard let endDate = endEvent.endDate else { return [] }
                    endEvent.startDate = Calendar.current.date(bySetting: .hour, value: 0, of: endDate)
                    let _slots = findAvalibleSlots(event1: events[i+1],
                                                   event2: endEvent,
                                                   durantion: duration,
                                                   slotDistantionStep: slotDistantionStep)
                    slots.append(contentsOf: _slots)
                }
            }
        } catch {
            fatalError("Something went wrong, check your ics file.")
        }
        
        return slots
    }
    
    fileprivate func findAvalibleSlots(event1: CalendarEvent,
                                       event2: CalendarEvent,
                                       durantion: TimeInterval,
                                       slotDistantionStep: TimeInterval) -> [DateInterval] {
        var array: [DateInterval] = []
        
        guard
            let date1 = event1.endDate,
            let date2 = event2.startDate
            else { return [] }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm a"
        
        var i = 0
        while true {
            let date = date1.addingTimeInterval(TimeInterval(Double(i) * durantion))
            
            if date.addingTimeInterval(TimeInterval(slotDistantionStep)) > date2 {
                break;
            }
            
            i += 1
            array.append(DateInterval(start: date, duration: durantion))
        }
        return array
    }
}
