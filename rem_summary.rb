#!/usr/bin/env ruby
#
# Show a list of remind events for the next week, grouped by date and
# formatted for dzen.
#

require 'time'

class Event
  include Comparable

  attr_reader :date, :starttime, :endtime, :description

  def initialize date, startt, endt, desc
    @description = desc
    @starttime = startt
    @endtime = endt
    @date = date
  end

  def <=> other
    if date == other.date
      if starttime == nil && other.starttime == nil
        description <=> other.description
      else
        if starttime == nil
          -1
        elsif other.starttime == nil
          1
        else
          starttime <=> other.starttime
        end
      end
    else
      date <=> other.date
    end
  end

  def to_s dzen=false
    string = ""
    if starttime
      string += starttime.strftime '%H:%M'
      if endtime
        string += '-'
        string += endtime.strftime '%H:%M'
      end
      string += "^fg(\#ccc)" if dzen
      string += ": "
      string += "^fg()" if dzen
    end
    string += "^fg(\#ccc)" if dzen
    string += description
    string += "^fg()" if dzen
  end

  def self.parse string
    parts = string.split ' '
    date = Time.parse parts[0]
    startt,endt = nil
    descstart = 5
    if parts[5] =~ /(\d\d?:\d\d)(?:-(\d\d?:\d\d?))?/
      startt = Time.parse "#{parts[0]} #$1"
      endt = Time.parse "#{parts[0]} #$2" if $2
      descstart = 6
    end
    desc = parts[descstart..-1].join ' '

    new date, startt, endt, desc
  end
end

cal = `rem -s+2 -b1`
event_hash = {}
start_date = Time.parse "00:00"
end_date = start_date + 3600*24*7
cal.split("\n").each do |line|
  event = Event.parse(line)
  if (event.date >= start_date && event.date < end_date)
    event_hash[event.date] ||= []
    event_hash[event.date] << event
  end
end

def is_today time
  now = Time.now
  now.day == time.day && (now - time) <= 86399.0 # 00:00 - 23:59:59
end

dates = event_hash.keys.sort

dates.each do |date|
  events = event_hash[date]
  events.sort!
  if is_today(date)
    date_s = "^fg(\#6f6)Today^fg()"
  else
    date_s = date.strftime"%A"
  end
  puts date_s
  events.each do |event|
    puts "  #{event.to_s true}"
  end
end
