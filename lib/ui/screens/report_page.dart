import 'package:flutter/material.dart';
import 'package:safecity/ui/components/alert_modal.dart';
import 'package:safecity/ui/components/background_page.dart';
import 'package:safecity/ui/components/date_input.dart';
import 'package:safecity/ui/components/dropdown_input.dart';
import 'package:safecity/ui/components/elevated_button.dart';
import 'package:safecity/ui/components/media_input.dart';
import 'package:safecity/ui/components/switch_input.dart';
import 'package:safecity/ui/components/text_area_input.dart';
import 'package:safecity/ui/components/time_input.dart';
import 'package:safecity/ui/styles/fonts.dart';
import 'package:safecity/ui/styles/spaces.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundPage(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpaces.medium,
              vertical: AppSpaces.medium,
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpaces.small),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Reportar Incidente',
                      style: TextStyle(
                        fontSize: AppFonts.subheadingFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppSpaces.medium),
                    AppDropdown(
                      label: 'Tipo',
                      options: [
                        'Roubo',
                        'Assalto',
                        'Acidente de Trânsito',
                        'Vandalismo',
                        'Facada',
                        'Outros',
                      ],
                    ),
                    SizedBox(height: 20.0),
                    AppDateInput(
                      label: 'Data',
                      initialDate: DateTime.now(),
                      onDateSelected: (date) => print("Data selecionada: $date"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, selecione uma data';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    AppTimeInput(
                      label: 'Horário',
                      initialTime: TimeOfDay.now(),
                      onTimeSelected: (time) => print("Horário selecionado: $time"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, selecione um horário';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    AppTextArea(
                      label: 'Descrição do incidente',
                      onChanged: (value) {
                        print('Texto: $value');
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite uma descrição';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    AppMediaInput(
                      label: 'Tirar Foto',
                      isVideo: false,
                      onMediaSelected: (file) {
                        print('Foto selecionada: ${file.path}');
                      },
                    ),
                    SizedBox(height: 5.0),
                    AppMediaInput(
                      label: 'Gravar Vídeo',
                      isVideo: true,
                      onMediaSelected: (file) {
                        print('Vídeo selecionado: ${file.path}');
                      },
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SwitchApp(
                          isChecked: false,
                          label: 'Notificar via SMS (offline)',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    AppElevatedButton(
                      text: 'Registrar Incidente',
                      onPressed: () {
                        AppAlert.show(
                          context: context,
                          title: 'Sucesso!',
                          message: 'Incidente registrado com sucesso.',
                          isSuccess: true,
                          onConfirmed: () {
                            // ação após o botão OK
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
