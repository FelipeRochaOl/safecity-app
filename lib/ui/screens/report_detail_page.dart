import 'package:flutter/material.dart';
import 'package:safecity/ui/components/background_page.dart';
import 'package:safecity/ui/components/html_viewer.dart';
import 'package:safecity/ui/components/timer_text.dart';
import 'package:safecity/ui/styles/spaces.dart';

class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('O que eu faço agora?')),
      body: Stack(
        children: [
          BackgroundPage(),
          SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(AppSpaces.border),
              child: Column(
                children: <Widget>[
                  Text(
                    'Não se preocupe, vá para:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: AppSpaces.small),
                  Image.asset(
                    'assets/report_detail_placeholder.png',
                    width: double.infinity,
                    height: 250,
                  ),
                  SizedBox(height: AppSpaces.small),
                  AppTimerText(dateTime: '2023-10-01 12:00:00'),
                  SizedBox(height: AppSpaces.small),
                  AppHtmlViewer(
                    html: """
                  <section style="font-family: system-ui, -apple-system, 'Segoe UI', Roboto, Arial; line-height:1.5;">
                <!-- Cabeçalho -->
                <header style="display:flex; align-items:center; gap:12px; margin-bottom:12px;">
                  <div style="padding:4px 8px; border-radius:999px; font-size:12px; background:#fee2e2; color:#991b1b;">
                    ALERTA URGENTE
                  </div>
                  <h1 style="margin:0; font-size:20px;">Incidente na Avenida Paulista</h1>
                </header>
              
                <!-- Metadados -->
                <div style="font-size:13px; color:#6b7280; margin-bottom:16px;">
                  <span><strong>Gravidade:</strong> Alta</span> ·
                  <span><strong>Local:</strong> Avenida Paulista, São Paulo</span> ·
                  <span><strong>Horário:</strong> {{hora_atual}}</span>
                </div>
              
                <!-- Resumo -->
                <article style="background:#f9fafb; border:1px solid #e5e7eb; border-radius:8px; padding:12px; margin-bottom:16px;">
                  <p style="margin:0;">
                    Foi reportado um <strong>assalto com vítimas fatais (2)</strong> na região da Avenida Paulista. 
                    As autoridades podem estar a caminho. Evite aproximar-se do local do incidente e priorize a sua segurança.
                  </p>
                </article>
              
                <!-- Ações imediatas -->
                <h2 style="margin:0 0 8px 0; font-size:16px;">O que fazer agora</h2>
                <ol style="padding-left:18px; margin:0 0 16px 0;">
                  <li>Afastar-se do ponto do incidente e buscar uma via <strong>movimentada e iluminada</strong>.</li>
                  <li>Mantenha o celular em <strong>modo silencioso</strong> e evite manuseá-lo ostensivamente.</li>
                  <li>Se estiver em grupo, <strong>permaneçam juntos</strong> e sigam para um local seguro (estação, comércio aberto, base policial).</li>
                  <li>Ligue para <strong>190</strong> (Polícia Militar) para reportar a situação, se for seguro fazê-lo.</li>
                  <li>Assim que possível, informe familiares/amigos que você está em deslocamento para um local seguro.</li>
                </ol>
              
                <!-- Rotas de fuga (placeholders) -->
                <h2 style="margin:0 0 8px 0; font-size:16px;">Rotas de fuga sugeridas</h2>
                <p style="margin:0 0 8px 0; font-size:13px; color:#6b7280;">
                  *Rotas abaixo são sugestões gerais. Avalie condições em tempo real e evite aglomerações ou áreas escuras.
                </p>
                <ul style="padding-left:18px; margin:0 0 16px 0;">
                  <li>
                    <strong>Rota 1 (via ruas paralelas):</strong> Sair da Paulista por {{rua_paralela_1}} → seguir até {{via_segura_1}} → dirigir-se a {{ponto_seguro_1}}.
                    <div style="margin-top:6px;">
                      <a href="{{link_mapa_rota_1}}" style="font-size:13px; color:#2563eb; text-decoration:underline;">
                        Ver no mapa
                      </a>
                    </div>
                  </li>
                  <li style="margin-top:10px;">
                    <strong>Rota 2 (acesso a metrô/estação):</strong> Descer até {{estacao_metro}} pela {{rua_paralela_2}} → permanecer em área com vigilância/fluxo.
                    <div style="margin-top:6px;">
                      <a href="{{link_mapa_rota_2}}" style="font-size:13px; color:#2563eb; text-decoration:underline;">
                        Ver no mapa
                      </a>
                    </div>
                  </li>
                  <li style="margin-top:10px;">
                    <strong>Rota 3 (ponto de apoio):</strong> Seguir para {{base_policia_ou_comercio_24h}} pela {{via_segura_2}}.
                    <div style="margin-top:6px;">
                      <a href="{{link_mapa_rota_3}}" style="font-size:13px; color:#2563eb; text-decoration:underline;">
                        Ver no mapa
                      </a>
                    </div>
                  </li>
                </ul>
              
                <!-- Botões de ação -->
                <div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:16px;">
                  <a href="tel:190" style="display:inline-block; padding:10px 14px; background:#ef4444; color:white; border-radius:8px; text-decoration:none; font-weight:600;">
                    Ligar 190 (Polícia)
                  </a>
                  <a href="{{link_mapa_seguro}}" style="display:inline-block; padding:10px 14px; background:#2563eb; color:white; border-radius:8px; text-decoration:none; font-weight:600;">
                    Abrir mapa seguro
                  </a>
                  <a href="{{link_compartilhar_local}}" style="display:inline-block; padding:10px 14px; background:#111827; color:white; border-radius:8px; text-decoration:none; font-weight:600;">
                    Compartilhar localização
                  </a>
                </div>
              
                <!-- Dicas de segurança -->
                <h2 style="margin:0 0 8px 0; font-size:16px;">Dicas rápidas</h2>
                <ul style="padding-left:18px; margin:0 0 16px 0;">
                  <li>Evite atalhos por vielas ou locais com baixa iluminação.</li>
                  <li>Entre em estabelecimentos abertos se precisar aguardar.</li>
                  <li>Se presenciar feridos, acione o <strong>192 (SAMU)</strong> ou <strong>193 (Bombeiros)</strong> — só preste auxílio se houver segurança.</li>
                </ul>
              
                <!-- Observações -->
                <aside style="font-size:12px; color:#6b7280; background:#f3f4f6; border:1px solid #e5e7eb; border-radius:8px; padding:10px;">
                  <strong>Observação:</strong> Esta é uma orientação geral baseada no relato. 
                  Para informações oficiais em tempo real, siga as instruções das autoridades locais.
                </aside>
              </section>
              
                """,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
