class SnpService < AndMeApiService
  def find_basepairs(position)
    response = get("/genotypes/#{@current_user.participant_credential.uid}/?locations=#{position}")
    response[position]
  end
end
