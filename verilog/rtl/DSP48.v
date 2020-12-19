// SPDX-FileCopyrightText: 2020 diadatp <admin@diadatp.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

module DSP48 (
  input               wb_clk_i,
  input               wb_rst_i,
  input               wb_CYC,
  input               wb_STB,
  output              wb_ACK,
  input               wb_WE,
  input      [31:0]   wb_ADR,
  output reg [31:0]   wb_DAT_MISO,
  input      [31:0]   wb_DAT_MOSI,
  input      [0:0]    wb_SEL,
  input      [127:0]  la_data_in,
  input      [37:0]   io_in,
  output reg [37:0]   io_out,
  output     [37:0]   io_oeb,
  input               user_clock2 
);
  wire       [40:0]   _zz_3_;
  wire       [47:0]   _zz_4_;
  wire                dspArea_wbCtrl_askWrite;
  wire                dspArea_wbCtrl_askRead;
  wire                dspArea_wbCtrl_doWrite;
  wire                dspArea_wbCtrl_doRead;
  reg                 _zz_1_;
  reg        [24:0]   dspArea_regA;
  reg        [15:0]   dspArea_regB;
  reg        [47:0]   dspArea_regP;
  wire       [47:0]   _zz_2_;
  reg        [15:0]   dacArea_dac_cnt_0;
  reg        [15:0]   dacArea_dac_cnt_1;
  reg        [15:0]   dacArea_dac_cnt_2;
  reg        [15:0]   dacArea_dac_cnt_3;
  reg        [15:0]   dacArea_dac_cnt_4;
  reg        [15:0]   dacArea_dac_cnt_5;
  reg        [15:0]   dacArea_dac_cnt_6;
  reg        [15:0]   dacArea_dac_cnt_7;

  assign _zz_3_ = (dspArea_regA * dspArea_regB);
  assign _zz_4_ = {7'd0, _zz_3_};
  always @ (*) begin
    wb_DAT_MISO = 32'h0;
    case(wb_ADR)
      32'b00000000000000000000000000000000 : begin
      end
      32'b00000000000000000000000000000100 : begin
      end
      32'b00000000000000000000000000001000 : begin
        wb_DAT_MISO[31 : 0] = _zz_2_[31 : 0];
      end
      32'b00000000000000000000000000001100 : begin
        wb_DAT_MISO[15 : 0] = _zz_2_[47 : 32];
      end
      32'b00000000000000000000000000010000 : begin
        wb_DAT_MISO[24 : 0] = dspArea_regA;
      end
      default : begin
      end
    endcase
  end

  assign dspArea_wbCtrl_askWrite = ((wb_CYC && wb_STB) && wb_WE);
  assign dspArea_wbCtrl_askRead = ((wb_CYC && wb_STB) && (! wb_WE));
  assign dspArea_wbCtrl_doWrite = (((wb_CYC && wb_STB) && ((wb_CYC && wb_ACK) && wb_STB)) && wb_WE);
  assign dspArea_wbCtrl_doRead = (((wb_CYC && wb_STB) && ((wb_CYC && wb_ACK) && wb_STB)) && (! wb_WE));
  assign wb_ACK = (_zz_1_ && wb_STB);
  assign _zz_2_ = dspArea_regP;
  assign io_oeb = 38'h3fffffffff;
  always @ (*) begin
    io_out[0] = dacArea_dac_cnt_0[15];
    io_out[1] = dacArea_dac_cnt_1[15];
    io_out[2] = dacArea_dac_cnt_2[15];
    io_out[3] = dacArea_dac_cnt_3[15];
    io_out[4] = dacArea_dac_cnt_4[15];
    io_out[5] = dacArea_dac_cnt_5[15];
    io_out[6] = dacArea_dac_cnt_6[15];
    io_out[7] = dacArea_dac_cnt_7[15];
    io_out[8] = dacArea_dac_cnt_0[15];
    io_out[9] = dacArea_dac_cnt_1[15];
    io_out[10] = dacArea_dac_cnt_2[15];
    io_out[11] = dacArea_dac_cnt_3[15];
    io_out[12] = dacArea_dac_cnt_4[15];
    io_out[13] = dacArea_dac_cnt_5[15];
    io_out[14] = dacArea_dac_cnt_6[15];
    io_out[15] = dacArea_dac_cnt_7[15];
    io_out[16] = dacArea_dac_cnt_0[15];
    io_out[17] = dacArea_dac_cnt_1[15];
    io_out[18] = dacArea_dac_cnt_2[15];
    io_out[19] = dacArea_dac_cnt_3[15];
    io_out[20] = dacArea_dac_cnt_4[15];
    io_out[21] = dacArea_dac_cnt_5[15];
    io_out[22] = dacArea_dac_cnt_6[15];
    io_out[23] = dacArea_dac_cnt_7[15];
    io_out[24] = dacArea_dac_cnt_0[15];
    io_out[25] = dacArea_dac_cnt_1[15];
    io_out[26] = dacArea_dac_cnt_2[15];
    io_out[27] = dacArea_dac_cnt_3[15];
    io_out[28] = dacArea_dac_cnt_4[15];
    io_out[29] = dacArea_dac_cnt_5[15];
    io_out[30] = dacArea_dac_cnt_6[15];
    io_out[31] = dacArea_dac_cnt_7[15];
    io_out[37 : 32] = 6'h0;
  end

  always @ (posedge wb_clk_i) begin
    if(wb_rst_i) begin
      _zz_1_ <= 1'b0;
      dspArea_regA <= 25'h0;
      dspArea_regB <= 16'h0;
      dspArea_regP <= 48'h0;
    end else begin
      _zz_1_ <= (wb_STB && wb_CYC);
      case(wb_ADR)
        32'b00000000000000000000000000000000 : begin
          if(dspArea_wbCtrl_doWrite)begin
            dspArea_regA <= wb_DAT_MOSI[24 : 0];
          end
        end
        32'b00000000000000000000000000000100 : begin
          if(dspArea_wbCtrl_doWrite)begin
            dspArea_regB <= wb_DAT_MOSI[15 : 0];
          end
        end
        32'b00000000000000000000000000001000 : begin
        end
        32'b00000000000000000000000000001100 : begin
        end
        32'b00000000000000000000000000010000 : begin
          if(dspArea_wbCtrl_doRead)begin
            dspArea_regP <= (dspArea_regP + _zz_4_);
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge user_clock2) begin
    if(wb_rst_i) begin
      dacArea_dac_cnt_0 <= 16'h0;
      dacArea_dac_cnt_1 <= 16'h0;
      dacArea_dac_cnt_2 <= 16'h0;
      dacArea_dac_cnt_3 <= 16'h0;
      dacArea_dac_cnt_4 <= 16'h0;
      dacArea_dac_cnt_5 <= 16'h0;
      dacArea_dac_cnt_6 <= 16'h0;
      dacArea_dac_cnt_7 <= 16'h0;
    end else begin
      dacArea_dac_cnt_0 <= (dacArea_dac_cnt_0 + la_data_in[15 : 0]);
      dacArea_dac_cnt_1 <= (dacArea_dac_cnt_1 + la_data_in[31 : 16]);
      dacArea_dac_cnt_2 <= (dacArea_dac_cnt_2 + la_data_in[47 : 32]);
      dacArea_dac_cnt_3 <= (dacArea_dac_cnt_3 + la_data_in[63 : 48]);
      dacArea_dac_cnt_4 <= (dacArea_dac_cnt_4 + la_data_in[79 : 64]);
      dacArea_dac_cnt_5 <= (dacArea_dac_cnt_5 + la_data_in[95 : 80]);
      dacArea_dac_cnt_6 <= (dacArea_dac_cnt_6 + la_data_in[111 : 96]);
      dacArea_dac_cnt_7 <= (dacArea_dac_cnt_7 + la_data_in[127 : 112]);
    end
  end


endmodule
