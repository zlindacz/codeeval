=begin
WORKING EXPERIENCE
CHALLENGE DESCRIPTION:

You are building a new social platform and want to store user's work experience. You have decided to calculate the total experience of each user in years based on the time periods that they provided. Using this approach, you need to be sure that you are taking into account the overlapping time periods in order to retrieve the actual work experience in years.

For example:

Jan 2010-Dec 2010
Jan 2010-Dec 2010
Two jobs with 12 months of experience each, but actual work experience is 1 year because of the overlapping time periods. The task is to calculate the actual work experience based on the list of time intervals.

INPUT SAMPLE:

Your program should accept a path to a filename as its first argument. Each line of the file contains a list of time periods separated by a semicolon and a single space. Each time period is represented as the begin date and the end date. Each date consists of a month as an abbreviated name and a year with century as a decimal number separated by a single space. The begin date and the end date are separated by a hyphen.

For example:

1
2
3
4
5
Feb 2004-Dec 2009; Sep 2004-Jul 2008
Aug 2013-Mar 2014; Apr 2013-Aug 2013; Jun 2014-Aug 2015; Apr 2003-Nov 2004; Apr
2014-Jan 2015
Mar 2003-Jul 2003; Nov 2003-Jan 2004; Apr 1999-Nov 1999
Apr 1992-Dec 1993; Feb 1996-Sep 1997; Jan 2002-Jun 2002; Sep 2003-Apr 2004; Feb
2010-Nov 2011
Feb 2004-May 2004; Jun 2004-Jul 2004
OUTPUT SAMPLE:

Print out the actual work experience in years for each test case.

For example:

1
2
3
4
5
5
4
1
6
0
CONSTRAINTS:

The number of lines in a file is in a range from 20 to 40.
The dates are in a range from Jan 1990 to Dec 2020.
The end date is greater than the begin date.
The begin date is the first day of a given month, and the end date is the last day of a given month.
=end



# Time travels in a single direction, thus a point in time is only encountered once, and therefore can be uniquely identified
# the problem states that "The dates are in a range from Jan 1990 to Dec 2020."
# each experience is expressed in this format: "Feb 2004-Dec 2009"
# therefore each month-year combination can be written as distance from the beginning (Jan 1990), in months
# for example, Feb 2004 is (2004-1999) * 12 + (2-1) = 61 months away from Jan 1990
# because start date is start of month and end date is end of month, when we calculate time between start and end dates we have to account for the month in between (e.g. Jun 2009 - Jul 2009 is actually 2 months because 6/1/2009 - 7/31/2009)

START_YEAR = 1990
def transform_line_to_dates(line)
  # line = 'Feb 2004-Dec 2009; Sep 2004-Jul 2008'
  line = line.chomp.split('; ')
  line.map { |date_range| date_range.split('-')}
  # [["Feb 2004", "Dec 2009"], ["Sep 2004", "Jul 2008"]]
end

def transform_date_to_months(date)
  months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  date = date.split(' ')
  year = date.last
  month = months.index(date.first)
  (year.to_i-START_YEAR) * 12 + month
end

File.open(ARGV[0]).each_line do |line|
  line = transform_line_to_dates(line)

  new_dates = line.map do |date_range|
    [transform_date_to_months(date_range[0]), transform_date_to_months(date_range[1]) + 1]
    # +1 because ending month is at end of month, unlike starting month
  end
  # [[169, 240], [176, 224]]

  new_dates = new_dates.sort
  time = 0
  start_time = new_dates.first[0]
  end_time = new_dates.first[1]

  new_dates.slice(1, new_dates.length-1).each do |date|
    if date.first > end_time
      time += end_time - start_time
      start_time = date.first
      end_time = date.last
    elsif date.last > end_time
      end_time = date.last
    end
    if date == new_dates[-1]
      time += end_time - start_time
    end
  end
  puts time/12
end
