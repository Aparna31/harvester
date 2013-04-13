require 'harvested'

module Harvest
  CREDENTIALS = CREDENTIALS['harvest'].values_at('subdomain', 'username', 'password')
  GATEWAY = Harvest.hardy_client(*CREDENTIALS)

  def self.invoices_total
    GATEWAY.invoices.all.map{ |i| i.amount.to_f }.inject(0, :+)
  end
  
  def self.time_entries
    project = 'Macys'
    entries = GATEWAY.reports.time_by_project(project, Time.parse("04/08/2013"), Time.parse("04/14/2010"))
    puts "Entries:"
    entries.each {|e| p e}
  end
  
end
