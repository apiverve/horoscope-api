declare module '@apiverve/horoscope' {
  export interface horoscopeOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface horoscopeResponse {
    status: string;
    error: string | null;
    data: HoroscopeData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface HoroscopeData {
      color:         null | string;
      compatibility: (null | string)[];
      horoscope:     null | string;
      luckyNumber:   number | null;
      luckyTime:     null | string;
      mood:          null | string;
      sign:          null | string;
      zodiac:        Zodiac;
  }
  
  interface Zodiac {
      element: null | string;
      name:    null | string;
      stone:   null | string;
      symbol:  null | string;
  }

  export default class horoscopeWrapper {
    constructor(options: horoscopeOptions);

    execute(callback: (error: any, data: horoscopeResponse | null) => void): Promise<horoscopeResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: horoscopeResponse | null) => void): Promise<horoscopeResponse>;
    execute(query?: Record<string, any>): Promise<horoscopeResponse>;
  }
}
