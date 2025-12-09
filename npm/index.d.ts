declare module '@apiverve/horoscope' {
  export interface horoscopeOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface horoscopeResponse {
    status: string;
    error: string | null;
    data: HoroscopeData;
    code?: number;
  }


  interface HoroscopeData {
      color:         string;
      compatibility: string[];
      horoscope:     string;
      luckyNumber:   number;
      luckyTime:     string;
      mood:          string;
      sign:          string;
      zodiac:        Zodiac;
  }
  
  interface Zodiac {
      element: string;
      name:    string;
      stone:   string;
      symbol:  string;
  }

  export default class horoscopeWrapper {
    constructor(options: horoscopeOptions);

    execute(callback: (error: any, data: horoscopeResponse | null) => void): Promise<horoscopeResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: horoscopeResponse | null) => void): Promise<horoscopeResponse>;
    execute(query?: Record<string, any>): Promise<horoscopeResponse>;
  }
}
