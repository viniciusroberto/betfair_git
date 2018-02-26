class Betfair < SitePrism::Page
  auxiliar = 1
  element :login, '#ssc-liu'
  element :senha, '#ssc-lipw'
  element :btnEntrar, '#ssc-lis'
  element :txtPesquisar, :xpath, "//*[@id='ssc-search']/div/form/input"
  element :btnPesquisar, :xpath, "//*[@id='ssc-search']/div/form/button"
  element :back, :xpath, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/bf-marketview-runners-list[2]/div/div/div/table/tbody/tr[1]/td[4]/button/div/span[1]"
  element :aposta, 'input[id*=stake-id-p-back]'
  element :lay, :xpath, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/bf-marketview-runners-list[2]/div/div/div/table/tbody/tr[2]/td[4]/button/div/span[1]"
  element :empate, :xpath, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/bf-marketview-runners-list[2]/div/div/div/table/tbody/tr[3]/td[4]/button/div/span[1]"
  element :tempo, :xpath, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[1]/div[1]/div/div[1]/main/ng-include[3]/section/div[2]/bf-coupon-table[1]/div/table/tbody/tr[#{auxiliar}]/td[1]/a/bf-event-line/section/data-bf-livescores/section/div/div/data-bf-livescores-time-elapsed/ng-include/div/div/div"
  element :odd_maior_seis, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/bf-marketview-runners-list[2]/div/div/div/table/tbody/tr[1]/td[4]/button"
  element :futebol_menu, :xpath, '//*[@id="main-wrapper"]/div/div[3]/div/div[1]/div[4]/div/div/div/ng-include/div/div/ul/li/tree-section/span/div/div/div/ul/li[18]/a'
  element :futebol_menu2, :xpath, '//*[@id="main-wrapper"]/div/div[3]/div/div[1]/div[4]/div/div/div/ng-include/div/div/ul/li[2]/tree-section/ul/li/a'
  element :ordenacaoPor, :xpath, '//*[@id="main-wrapper"]/div/div[3]/div/div[2]/div/div[1]/div[1]/div[1]/div/div[1]/main/ng-include[2]/section/div[1]/div/bf-select/div/label'
  element :data, :xpath, '//*[@id="main-wrapper"]/div/div[3]/div/div[2]/div/div/div/div[1]/div[1]/div[1]/main/ng-include[2]/section/div[1]/div/bf-select/div/div/bf-option[2]/span'
  element :jogo, :xpath, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div/div/div[1]/div[1]/div[1]/main/ng-include[3]/section[1]/div[2]/bf-coupon-table[1]/div/table/tbody/tr[#{auxiliar}]/td[1]/a/bf-event-line/section"
  element :hora, :xpath, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[1]/div[1]/div/div/div/ng-include/div[1]/p/span"

def validar_hora
  if page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[1]/div[1]/div/div/div/ng-include/div[1]/p/span") == false #verifica se a hora esta na tela
    $valorhora = 2
    puts $valorhora.class
    puts 'hora não esta presente'
  end
    if page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[1]/div[1]/div/div/div/ng-include/div[1]/p/span") == true
      $valorhora = hora.text.gsub(/'/,'').to_s
      if $valorhora == '' || $valorhora == 'Intervalo' || $valorhora == 'Terminado'
        $valorhora = 1
        puts $valorhora.class
        puts 'jogo está no intervalo ou acabou'
      else
        $valorhora = $valorhora.to_i
        puts $valorhora.class
        puts "O jogo esta nos #{$valorhora} minutos"
     end
   end
end

  def validar_odd
    if page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/bf-marketview-runners-list[2]/div/div/div/table/tbody/tr[2]/td[4]/button/div/span[1]") == true && page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/bf-marketview-runners-list[2]/div/div/div/table/tbody/tr[1]/td[4]/button/div/span[1]") == true  && page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/bf-marketview-runners-list[2]/div/div/div/table/tbody/tr[3]/td[4]/button/div/span[1]") == true && page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/div/div/span[2]") == false
      $valorBack = back.text.to_f
         $valorLay = lay.text.to_f
         $valorEmpate = empate.text.to_f
         puts "Back: #{$valorBack}"
         puts "Lay: #{$valorLay}"
         puts "Empate: #{$valorEmpate}"
else
  # $arq.puts "Odd vazia"
 puts "Odd vazia"
  return
end

  end


    def betfair
      # $arq = File.new("relatorio.txt", "a")
      visit 'https://www.betfair.com/'

      arq = File.new("relatorio.xml", "a")
        arq.puts "Nome do funcionario: "
        arq.print "Data: "
arq.print data.strftime("%d/%m/%Y - %H:%M:%S")
        arq.close
      sleep 3
      login.set 'rabetti.g@gmail.com'
      senha.set 'TdGr4410039492**'
      btnEntrar.click
      sleep 5
      click_on 'Intercâmbio'
      sleep 6
      futebol_menu.click
      sleep 4
      ordenacaoPor.click
      sleep 3
      data.click
      sleep 4
      auxiliar = 1
      $valorBack = 5.0
      $valorLay = 5.0
      $valorEmpate = 5.0
      begin
        loop do
          if page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div/div/div[1]/div[1]/div[1]/main/ng-include[3]/section[1]/div[2]/bf-coupon-table[1]/div/table/tbody/tr[#{auxiliar}]/td[1]/a/bf-event-line/section") == true
            find(:xpath, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div/div/div[1]/div[1]/div[1]/main/ng-include[3]/section[1]/div[2]/bf-coupon-table[1]/div/table/tbody/tr[#{auxiliar}]/td[1]/a/bf-event-line/section").click
            # hora = Time.now.strftime("%H:%M").to_s
            # puts hora
            # nome_jogo = page.find(:xpath, "//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[1]/div[1]/div/div/div/ng-include/div[1]/ng-include/div").text.to_s
            # $arq.puts "Jogo: ** #{nome_jogo} **"
            # $arq.puts "jogo: #{auxiliar}"
            # puts "jogo: #{auxiliar}"
            validar_odd
            # $arq.puts "verificando se a Odd esta entre 1.06 e 1.15"
            validar_hora
            puts "verificando se a Odd esta entre 1.06 e 1.15"
            # valorTempo = tempo.text.gsub(/'/, '').to_i
            if $valorEmpate < 1.12 && $valorEmpates > 1.05 && $valorhora > 79 or $valorLay < 1.12 && $valorLay > 1.05 && $valorhora > 79 or $valorBack < 1.12 && $valorBack > 1.05 && $valorhora > 79
              loop do
                $valorBack = back.text.to_f
                $valorLay = lay.text.to_f
                $valorEmpate = empate.text.to_f
                valorAposta = 1.05.to_f
              if $valorBack <= valorAposta && page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/div/div/span[2]") == false
                    # $arq.puts "A aposta sera realizada em: Back no valor de ODD: #{$valorBack}"
                    puts "A aposta sera realizada em: Back no valor de ODD: #{$valorBack}"
                    back.click
                    aposta.set '5'
                    click_button 'Apostar'
                    sleep 20
                    break
                  #end
                elsif $valorLay <= valorAposta && page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/div/div/span[2]") == false
                    # $arq.puts "A aposta sera realizada em: Lay no valor da ODD: #{$valorLay}"
                    puts "A aposta sera realizada em: Lay no valor da ODD: #{$valorLay}"
                    lay.click
                    aposta.set '5'
                    click_button 'Apostar'
                    sleep 20
                    break
                  #end
                elsif $valorEmpate <= valorAposta && page.has_xpath?("//*[@id='main-wrapper']/div/div[3]/div/div[2]/div/div[1]/div[3]/div/div[1]/div/bf-main-market/bf-main-marketview/div/div[2]/div/div/span[2]") == false
                    # $arq.puts "A aposta sera realizada em: Empate no valor da ODD: #{$valorEmpate}"
                    puts "A aposta sera realizada em: Empate no valor da ODD: #{$valorEmpate}"
                    empate.click
                    aposta.set '5'
                    click_button 'Apostar'
                    sleep 20
                    break
                  end

              end # Segundo Loop

            end # if valorEmpate < 1.15 && valorEmpate > 1.05
              # $arq.puts "nao atendeu aos requisitos da aposta"
              puts "____________________________________________"
              puts "nao atendeu aos requisitos da aposta"

              futebol_menu2.click # voltar aos jogos
              auxiliar += 1 # variavel pora percorrer aos jogos
              else # Se não tiver o jogos
                auxiliar = 1
              end

      end # Primeiro IF (verifica se tem o jogo)

    end # Método
    # rescue
    #   puts 'Aeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee porraaaaaaaa'
    #   click_on 'Intercâmbio'
    #   sleep 3
    #   futebol_menu.click
    # end
  end # Class
end

#$arq.puts "valor aposta #{valorAposta}"
