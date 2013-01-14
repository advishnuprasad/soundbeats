module ResultsHelper
  def build_roll_nos(results)
    options = {'-- Please Select  --' => ''}
    results.each {|result| options = options.merge({result.student_id.to_s => result.student_id}) }
    options
  end
end
