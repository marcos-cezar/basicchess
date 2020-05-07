

import 'package:flutter_chess_board/flutter_chess_board.dart';

class ChessDescriptions {
  Map<String, String> pieceDescriptions = {

    PieceType.Pawn.toString() : '''
    
    O peão move-se verticalmente na coluna que encontra-se, sendo incapaz de recuar. 
    No primeiro movimento, a partir do ponto de partida, pode avançar duas casas e, a partir daí, uma.
    Um peão pode capturar a peça imediatamente na fileira na diagonal. Quando na quinta fileira, pode capturar en passant o peão adversário na coluna adjacente que avançar duas casas em seu primeiro movimento. Ao atingir a oitava linha transforma-se em qualquer outra peça, excluindo o rei, movimento chamado de coroação ou promoção; o peão será substituído imediatamente por outra peça que pelo cavalo, bispo, torre ou rainha e deverá ser removido do tabuleiro. Vale se atentar que ao ser transformado ele não pode ser removido em um primeiro movimento.
    ''',

    PieceType.Bishop.toString() : '''
    Movimenta-se em diagonal, não podendo pular peças intervenientes, e captura tomando o lugar ocupado pela peça adversária. 
    Devido às características de seu movimento tem a deficiência da fraqueza da cor onde seu movimento fica limitado à cor da casa de onde inicia a partida.
    ''',

    PieceType.King.toString()  : '''
    O Rei é a peça mais importante do xadrez, cuja captura é o único objetivo do jogo. Uma vez que não pode ser trocado durante uma partida, ele é considerado uma peça de valor inestimável.
    Durante uma partida, o Rei não pode permanecer sob ameaça das peças adversárias em nenhum instante, devendo ser colocado em segurança imediatamente no movimento seguinte, caso seja atacado. As regras de etiqueta no xadrez indicam que ao ameaçar o Rei do adversário, o atacante pode quebrar o silêncio da partida e anunciar "Xeque!" e, no caso do Rei não poder escapar da captura, anunciar "Xeque-mate!". 
    Esses gestos são considerados opcionais segundo as regras do jogo.
    A sua movimentação consiste no deslocamento de uma casa na direção horizontal, vertical ou diagonal, desde que ela não esteja sob ataque adversário. Caso ainda não tenha sido movimentado no jogo, é permitido ao Rei realizar um movimento especial denominado roque com uma das torres, com o que se pode protegê-lo deslocando-o duas casas horizontalmente, caso estas casas não estejam sob ataque e o Rei não esteja em xeque. 
    ''',

    PieceType.Knight.toString() : '''
    Tem um movimento assemelhado a um "L" e, diferente das outras peças, pode pular as peças intervenientes. 
    Captura tomando a casa ocupada pela peça adversário, sendo sempre no final do L.
    A peça é mais ativa no centro ampliado onde pode atacar mais casas do que no canto e é a única que não consegue perder um tempo e em função disso não consegue evitar posições de zugzwang. 
     ''',

    PieceType.Queen.toString() : '''
    É a peça de maior valor relativo do jogo. Assim como a Torre, é capaz de, com o auxílio do seu Rei, vencer uma partida contra um Rei solitário. 
    Por sua alta mobilidade é a peça preferida do enxadrista iniciante.
     ''',

    PieceType.Rook.toString() : ''' 
    Movimenta-se na horizontal e vertical por todo o tabuleiro.
    É Empregada usualmente no meio-jogo e fase final devido ao seu valor estratégico e tático. Seu valor relativo é alto, podendo variar para mais em função de seu posicionamento em colunas ou fileiras abertas, ou formações estratégicas.
    '''
  };
}