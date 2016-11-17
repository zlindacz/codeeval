def time_between_dates(date1, date2)
  date2.to_f - date1.to_f
end

def convert_date_to_decimal(date) # date = 'Feb 2004'
  months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  date = date.split(' ')
  year = date.last
  month = months.index(date.first)/12.0
  year.to_i + month
end


File.open(ARGV[0]).each_line do |line|
  line = line.chomp.split('; ') # ['Feb 2004-Dec 2009', 'Sep 2004-Jul 2008']
  new_dates = line.map { |date_range| date_range.split('-').map { |date| convert_date_to_decimal(date)}}
  new_dates = new_dates.sort
  time = 0
  start_time = new_dates.first[0]
  end_time = new_dates.first[1]

  new_dates.slice(1, new_dates.length-1).each do |date|
    if date.first > end_time
      time += time_between_dates(start_time, end_time)
      start_time = date.first
      end_time = date.last
    elsif date.last > end_time
      end_time = date.last
    end
    if date == new_dates[-1]
      time += time_between_dates(start_time, end_time)
    end
  end
  puts time.to_i + 1/12
end


=begin
input:
Feb 2004-Dec 2009; Sep 2004-Jul 2008
Aug 2013-Mar 2014; Apr 2013-Aug 2013; Jun 2014-Aug 2015; Apr 2003-Nov 2004; Apr 2014-Jan 2015
Mar 2003-Jul 2003; Nov 2003-Jan 2004; Apr 1999-Nov 1999
Apr 1992-Dec 1993; Feb 1996-Sep 1997; Jan 2002-Jun 2002; Sep 2003-Apr 2004; Feb 2010-Nov 2011
Feb 2004-May 2004; Jun 2004-Jul 2004

output:
5
4
1
6
0
=end
