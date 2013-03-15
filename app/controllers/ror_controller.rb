require 'TPSLUtil'
require 'net/http'
require 'net/https'

class RorController < ApplicationController
  def initialize

  end
  #***************************************************************
  #********Request Page ******************************************

  def setrequestbean
    @reqerror=''
    @resperror=''
    transid= params[:transid]
    marketcode= params[:marketcode]
    acno= params[:acno]
    txnamount= params[:txnamount]
    bankcode= params[:bankcode]
#*** The function return the string ***
    objTranDetails =Tpslutil::CheckSumRequestBean.new
    objTranDetails.setStrMerchantTranId(transid);
    objTranDetails.setStrMarketCode(marketcode);
    objTranDetails.setStrAccountNo(acno);
    objTranDetails.setStrAmt(txnamount);
    objTranDetails.setStrBankCode(bankcode);
    #proppath=params[:filepath]
    proppath="MarchantDetailsTest.properties"
    objTranDetails.setStrPropertyPath(proppath);

#*** This function return the checksum string ***
    @msg = Tpslutil.transactionRequestMessage(objTranDetails);
    puts "msg*****"+"#{@msg}"
    #*** displaying i/p parameter ***
    @MerchantTranId =objTranDetails.getStrMerchantTranId
    @MarketCode=objTranDetails.getStrMarketCode
    @AccountNo=objTranDetails.getStrAccountNo
    @Amt=objTranDetails.getStrAmt
    @BankCode=objTranDetails.getStrBankCode
    @proppath=objTranDetails.getStrPropertyPath

  end
  #***************************************************************
  #******* Response Page *****************************************
  def getresponsebean
    ##*** get response from TPSL and
    #@strResponseMsg="L100|123|567|NA|7000.00|HDF|22270726|NA|INR|NA|NA|NA|NA|12-12-2004 16:08:56|0300|NA|NA|NA|NA|NA|NA|NA|NA|NA|NA|855955509"
    #objResTranDetails = CheckSumResponseBean.new()
    #objResTranDetails.setStrMSG(@strResponseMsg);
    #objResTranDetails.setStrPropertyPath("D:\\Sachin\\DeveloperWork\\Payment Gateway\\rerubyonrailssupport\\JSP_CheckSumIntegartion\\Jar File\\MarchantDetailsTest.properties");
    #util = TPSLUtil.new
    #strCheckSumResult = util.transactionResponseMessage(objResTranDetails);
    ##@message = Message.new(params[:transid])
    #puts "*********** getresponsebean ************"
    #puts strCheckSumResult
    #
    #begin
    #  #@respdata = Net::HTTP.get_response(URI.parse('http://mfieldforce.com/ror/getresponsebean')).body
    #  @val="indexinstancevar"
    #  #      client = Savon.client(wsdl: "https://www.tekprocess.co.in/ChecksumWebService/services/CheckSumCalculator?wsdl")
    #
    #  s="T2394|1|NA|NA|4|5|NA|NA|INR|NA|NA|NA|NA|NA|NA|NA|2|3|NA|NA|NA|NA|NA|http://mfieldforce.com/ror/getresponsebean"
    #  s1="6655951779LMRQSJ"
    #  #     response = client.call(:calculate_check_sum, message: { s: s, s1: s1 })
    #
    #
    #  # string =String.new("#{response.body}")
    #  # arr= string.split("=>")
    #  # str=String.new(arr[2]).split("\"")
    #  # str= str[1]
    #  str=""
    #  res = Net::HTTP.post_form(URI.parse('http://www.austere.co.in/sandbox/ascent/test.php'),
    #                            {'s'=>s, 's1'=>s1})
    #  str= res.body
    #  puts res.body
    #  #*******************
    #
    #  @newchecksum=str
    #  puts "str found"+str
    #
    #rescue Exception =>e
    #  @resperror= "Connection error."+e.message
    #end
  end
  def index

  end
end